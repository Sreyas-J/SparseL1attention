"""
EcoTransformer — L1 BigBird: IMDb Sentiment Classification
===========================================================

Trains an L1-BigBird on the IMDb dataset (25k train / 25k test, binary
sentiment). IMDb reviews are long enough to benefit from BigBird's
block-sparse attention at higher sequence lengths.

DATASET
-------
  IMDb (imdb on HuggingFace):
    - Train : 25,000 reviews  (balanced: 12,500 pos / 12,500 neg)
    - Test  : 25,000 reviews  (held-out; used as validation here)
    - Labels: 0 = negative, 1 = positive
  Average review length ~230 tokens (tokenized), max often >512.
  Padding/truncation to MAX_LENGTH=512.

  NOTE on block_sparse:
    Minimum seq for block_sparse = (5 + 2×num_random_blocks) × block_size
                                 = (5 + 2×3) × 64 = 704 tokens
    With MAX_LENGTH=512 < 704, BigBird auto-falls back to original_full.
    To exercise block_sparse, set --max_length 1024 (and reduce --batch_size).

L1 ATTENTION
------------
  Every attention score is computed as:
      score = -λ · Σ|Q_i - K_j|   (L1 pairwise distance)
  replacing the standard dot-product Q·Kᵀ.
  λ = 0.1  (negated so softmax peaks at similar Q/K pairs).
  Applied to both original_full and block_sparse paths.

BIGBIRD SPECIFICS
-----------------
  - No global_attention_mask needed (BigBird handles global tokens via
    first/last block design)
  - block_size=64, num_random_blocks=3
  - Tokenizer: BigBirdTokenizer (SentencePiece, same vocab as RoBERTa)

ARCHITECTURE
------------
  Base config  : google/bigbird-roberta-base
  Hidden size  : 768
  Layers       : 12 (full base)
  Heads        : 12
  Classifier   : LayerNorm → Linear(768,256) → GELU → Dropout(0.3) → Linear(256,2)

ANTI-OVERFITTING
  - AdamW lr=2e-5, weight_decay=0.01
  - Linear warm-up (1 epoch) + cosine LR decay
  - Gradient clipping max_norm=1.0
  - Early stopping patience=3, best checkpoint saved to ./best_bigbird_l1_imdb

Usage:
    python bigbird_imdb.py
    python bigbird_imdb.py --epochs 5 --batch_size 4
    python bigbird_imdb.py --max_length 1024 --batch_size 2  # exercises block_sparse
    python bigbird_imdb.py --model_path google/bigbird-roberta-base
    python bigbird_imdb.py --scratch

Requirements:
    pip install transformers datasets torch sentencepiece
"""

import os
import math
import argparse
import numpy as np

import torch
import torch.nn as nn
from torch.utils.data import DataLoader, Dataset
from torch.amp import GradScaler, autocast

from datasets import load_dataset
from transformers import (
    BigBirdConfig,
    BigBirdTokenizer,
    default_data_collator,
    get_cosine_schedule_with_warmup,
)
from transformers.models.big_bird.modeling_big_bird import (
    BigBirdSelfAttention,
    BigBirdBlockSparseAttention,
    BigBirdAttention,
    BigBirdLayer,
    BigBirdEncoder,
    BigBirdModel,
    BigBirdPreTrainedModel,
)
from transformers.utils import logging as hf_logging

hf_logging.set_verbosity_error()

# ── Constants ─────────────────────────────────────────────────────────────────
MAX_LENGTH = 512   # IMDb reviews can be long; set to 1024 to hit block_sparse
L1_LAMBDA  = -0.1


# ══════════════════════════════════════════════════════════════════════════════
# PART A: L1 distance helpers
# ══════════════════════════════════════════════════════════════════════════════

def l1_bmm_nd(query: torch.Tensor, key: torch.Tensor, ndim: int) -> torch.Tensor:
    """
    L1-distance replacement for BigBird's torch_bmm_nd_transpose.

    Handles two cases used by BigBird:
      ndim=4 : Q shape (bsz, n_heads, q_len, head_dim)
               K shape (bsz, n_heads, k_len, head_dim)
               Out     (bsz, n_heads, q_len, k_len)

      ndim=5 : Q shape (bsz, n_heads, n_chunks, q_len, head_dim)
               K shape (bsz, n_heads, n_chunks, k_len, head_dim)
               Out     (bsz, n_heads, n_chunks, q_len, k_len)
    """
    leading = query.shape[:ndim - 2]
    q_flat  = query.reshape(-1, query.shape[-2], query.shape[-1])   # (N, q, d)
    k_flat  = key.reshape(-1, key.shape[-2],   key.shape[-1])       # (N, k, d)

    diff   = q_flat.unsqueeze(2) - k_flat.unsqueeze(1)              # (N, q, k, d)
    scores = diff.abs().sum(dim=-1) * L1_LAMBDA                     # (N, q, k)

    return scores.view(leading + (query.shape[-2], key.shape[-2]))


def l1_einsum_bhlqk(query: torch.Tensor, key: torch.Tensor) -> torch.Tensor:
    """
    L1 replacement for the two global-band einsum calls:
        torch.einsum("bhlqd,bhkd->bhlqk", middle_query, global_key)

    Shapes:
        query : (bsz, n_heads, n_chunks, q_block, head_dim)
        key   : (bsz, n_heads,           k_block, head_dim)
        out   : (bsz, n_heads, n_chunks, q_block, k_block)
    """
    key_exp = key.unsqueeze(2)
    diff = query.unsqueeze(4) - key_exp.unsqueeze(3)   # (B,H,L,q,k,d)
    return diff.abs().sum(dim=-1) * L1_LAMBDA           # (B,H,L,q,k)


# ══════════════════════════════════════════════════════════════════════════════
# PART B: L1 BigBirdBlockSparseAttention
# ══════════════════════════════════════════════════════════════════════════════

class L1BigBirdBlockSparseAttention(BigBirdBlockSparseAttention):
    """BigBird block-sparse attention with L1 distance replacing all dot products."""

    @staticmethod
    def torch_bmm_nd_transpose(inp_1: torch.Tensor,
                                inp_2: torch.Tensor,
                                ndim:  int = None) -> torch.Tensor:
        return l1_bmm_nd(inp_1, inp_2, ndim)

    def bigbird_block_sparse_attention(
        self,
        query_layer, key_layer, value_layer,
        band_mask, from_mask, to_mask,
        from_blocked_mask, to_blocked_mask,
        n_heads, n_rand_blocks, attention_head_size,
        from_block_size, to_block_size,
        batch_size, from_seq_len, to_seq_len,
        seed, plan_from_length, plan_num_rand_blocks,
        output_attentions,
    ):
        if from_seq_len // from_block_size != to_seq_len // to_block_size:
            raise ValueError("Number of blocks must match.")

        rsqrt_d           = 1 / math.sqrt(attention_head_size)
        bsz               = batch_size
        attn_mask_penalty = -10000.0

        np.random.seed(seed)
        if from_seq_len in [1024, 3072, 4096]:
            rand_attn = [
                self._bigbird_block_rand_mask(
                    self.max_seqlen, self.max_seqlen,
                    from_block_size, to_block_size, n_rand_blocks, last_idx=1024
                )[:from_seq_len // from_block_size - 2]
                for _ in range(n_heads)
            ]
        else:
            if plan_from_length is None:
                plan_from_length, plan_num_rand_blocks = self._get_rand_attn_plan(
                    from_seq_len, from_block_size, n_rand_blocks)
            rand_attn = self._bigbird_block_rand_mask_with_head(
                from_seq_length=from_seq_len, to_seq_length=to_seq_len,
                from_block_size=from_block_size, to_block_size=to_block_size,
                num_heads=n_heads, plan_from_length=plan_from_length,
                plan_num_rand_blocks=plan_num_rand_blocks,
            )

        rand_attn = np.stack(rand_attn, axis=0)
        rand_attn = torch.tensor(rand_attn, device=query_layer.device, dtype=torch.long)
        rand_attn.unsqueeze_(0)
        rand_attn = torch.cat([rand_attn] * batch_size, dim=0)

        rand_mask = self._create_rand_mask_from_inputs(
            from_blocked_mask, to_blocked_mask, rand_attn,
            n_heads, n_rand_blocks, bsz, from_seq_len, from_block_size,
        )

        blocked_query_matrix = query_layer.view(
            bsz, n_heads, from_seq_len // from_block_size, from_block_size, -1)
        blocked_key_matrix   = key_layer.view(
            bsz, n_heads, to_seq_len   // to_block_size,   to_block_size,   -1)
        blocked_value_matrix = value_layer.view(
            bsz, n_heads, to_seq_len   // to_block_size,   to_block_size,   -1)

        gathered_key = self.torch_gather_b2(blocked_key_matrix, rand_attn).view(
            bsz, n_heads, to_seq_len // to_block_size - 2,
            n_rand_blocks * to_block_size, -1)
        gathered_value = self.torch_gather_b2(blocked_value_matrix, rand_attn).view(
            bsz, n_heads, to_seq_len // to_block_size - 2,
            n_rand_blocks * to_block_size, -1)

        # ── 1st block (global query → all keys) ───────────────────────────────
        first_product = self.torch_bmm_nd_transpose(
            blocked_query_matrix[:, :, 0], key_layer, ndim=4)
        first_product  = first_product * rsqrt_d
        first_product += (1.0 - to_mask) * attn_mask_penalty
        first_attn_weights  = nn.functional.softmax(first_product, dim=-1)
        first_context_layer = self.torch_bmm_nd(first_attn_weights, value_layer, ndim=4)
        first_context_layer.unsqueeze_(2)

        # ── 2nd block ─────────────────────────────────────────────────────────
        second_key_mat = torch.cat([
            blocked_key_matrix[:, :, 0], blocked_key_matrix[:, :, 1],
            blocked_key_matrix[:, :, 2], blocked_key_matrix[:, :, -1],
            gathered_key[:, :, 0],
        ], dim=2)
        second_value_mat = torch.cat([
            blocked_value_matrix[:, :, 0], blocked_value_matrix[:, :, 1],
            blocked_value_matrix[:, :, 2], blocked_value_matrix[:, :, -1],
            gathered_value[:, :, 0],
        ], dim=2)
        second_product = self.torch_bmm_nd_transpose(
            blocked_query_matrix[:, :, 1], second_key_mat, ndim=4)
        second_seq_pad = torch.cat([
            to_mask[:, :, :, :3 * to_block_size],
            to_mask[:, :, :, -to_block_size:],
            to_mask.new_ones([bsz, 1, 1, n_rand_blocks * to_block_size]),
        ], dim=3)
        second_rand_pad = torch.cat([
            rand_mask.new_ones([bsz, n_heads, from_block_size, 4 * to_block_size]),
            rand_mask[:, :, 0],
        ], dim=3)
        second_product  = second_product * rsqrt_d
        second_product += (1.0 - torch.minimum(second_seq_pad, second_rand_pad)) * attn_mask_penalty
        second_attn_weights  = nn.functional.softmax(second_product, dim=-1)
        second_context_layer = self.torch_bmm_nd(second_attn_weights, second_value_mat, ndim=4)
        second_context_layer.unsqueeze_(2)

        # ── Middle blocks ──────────────────────────────────────────────────────
        exp_blocked_key_matrix = torch.cat([
            blocked_key_matrix[:, :, 1:-3],
            blocked_key_matrix[:, :, 2:-2],
            blocked_key_matrix[:, :, 3:-1],
        ], dim=3)
        exp_blocked_value_matrix = torch.cat([
            blocked_value_matrix[:, :, 1:-3],
            blocked_value_matrix[:, :, 2:-2],
            blocked_value_matrix[:, :, 3:-1],
        ], dim=3)
        middle_query_matrix = blocked_query_matrix[:, :, 2:-2]

        inner_band_product = self.torch_bmm_nd_transpose(
            middle_query_matrix, exp_blocked_key_matrix, ndim=5) * rsqrt_d
        rand_band_product  = self.torch_bmm_nd_transpose(
            middle_query_matrix, gathered_key[:, :, 1:-1], ndim=5) * rsqrt_d

        # ← L1: replace einsum("bhlqd,bhkd->bhlqk") with l1_einsum_bhlqk
        first_band_product = l1_einsum_bhlqk(
            middle_query_matrix, blocked_key_matrix[:, :, 0]) * rsqrt_d
        last_band_product  = l1_einsum_bhlqk(
            middle_query_matrix, blocked_key_matrix[:, :, -1]) * rsqrt_d

        inner_band_product += (1.0 - band_mask) * attn_mask_penalty
        first_band_product += (1.0 - to_mask[:, :, :, :to_block_size].unsqueeze(3)) * attn_mask_penalty
        last_band_product  += (1.0 - to_mask[:, :, :, -to_block_size:].unsqueeze(3)) * attn_mask_penalty
        rand_band_product  += (1.0 - rand_mask[:, :, 1:-1]) * attn_mask_penalty

        band_product = torch.cat(
            [first_band_product, inner_band_product, rand_band_product, last_band_product], dim=-1)
        attn_weights = nn.functional.softmax(band_product, dim=-1)

        context_layer  = self.torch_bmm_nd(
            attn_weights[:, :, :, :, to_block_size:4 * to_block_size],
            exp_blocked_value_matrix, ndim=5)
        context_layer += self.torch_bmm_nd(
            attn_weights[:, :, :, :, 4 * to_block_size:-to_block_size],
            gathered_value[:, :, 1:-1], ndim=5)
        context_layer += torch.einsum(
            "bhlqk,bhkd->bhlqd",
            attn_weights[:, :, :, :, :to_block_size],
            blocked_value_matrix[:, :, 0])
        context_layer += torch.einsum(
            "bhlqk,bhkd->bhlqd",
            attn_weights[:, :, :, :, -to_block_size:],
            blocked_value_matrix[:, :, -1])

        # ── Second-last block ─────────────────────────────────────────────────
        second_last_key_mat = torch.cat([
            blocked_key_matrix[:, :, 0],
            blocked_key_matrix[:, :, -3],
            blocked_key_matrix[:, :, -2],
            blocked_key_matrix[:, :, -1],
            gathered_key[:, :, -1],
        ], dim=2)
        second_last_value_mat = torch.cat([
            blocked_value_matrix[:, :, 0],
            blocked_value_matrix[:, :, -3],
            blocked_value_matrix[:, :, -2],
            blocked_value_matrix[:, :, -1],
            gathered_value[:, :, -1],
        ], dim=2)
        second_last_product = self.torch_bmm_nd_transpose(
            blocked_query_matrix[:, :, -2], second_last_key_mat, ndim=4)
        second_last_seq_pad = torch.cat([
            to_mask[:, :, :, :to_block_size],
            to_mask[:, :, :, -3 * to_block_size:],
            to_mask.new_ones([bsz, 1, 1, n_rand_blocks * to_block_size]),
        ], dim=3)
        second_last_rand_pad = torch.cat([
            rand_mask.new_ones([bsz, n_heads, from_block_size, 4 * to_block_size]),
            rand_mask[:, :, -1],
        ], dim=3)
        second_last_product  = second_last_product * rsqrt_d
        second_last_product += (
            1.0 - torch.minimum(second_last_seq_pad, second_last_rand_pad)
        ) * attn_mask_penalty
        second_last_attn_weights  = nn.functional.softmax(second_last_product, dim=-1)
        second_last_context_layer = self.torch_bmm_nd(
            second_last_attn_weights, second_last_value_mat, ndim=4)
        second_last_context_layer.unsqueeze_(2)

        # ── Last block (global query → all keys) ──────────────────────────────
        last_product = self.torch_bmm_nd_transpose(
            blocked_query_matrix[:, :, -1], key_layer, ndim=4)
        last_product  = last_product * rsqrt_d
        last_product += (1.0 - to_mask) * attn_mask_penalty
        last_attn_weights  = nn.functional.softmax(last_product, dim=-1)
        last_context_layer = self.torch_bmm_nd(last_attn_weights, value_layer, ndim=4)
        last_context_layer.unsqueeze_(2)

        context_layer = torch.cat([
            first_context_layer, second_context_layer, context_layer,
            second_last_context_layer, last_context_layer,
        ], dim=2)
        context_layer = context_layer.view(bsz, n_heads, from_seq_len, -1) * from_mask
        context_layer = context_layer.transpose(1, 2)

        if output_attentions:
            attention_probs = torch.zeros(
                bsz, n_heads, from_seq_len, to_seq_len,
                dtype=query_layer.dtype, device=query_layer.device)
        else:
            attention_probs = None

        return context_layer, attention_probs


# ══════════════════════════════════════════════════════════════════════════════
# PART C: L1 BigBirdSelfAttention (original_full path)
# ══════════════════════════════════════════════════════════════════════════════

class L1BigBirdSelfAttention(BigBirdSelfAttention):
    """Full-sequence L1 attention for BigBird's `original_full` mode."""

    def forward(self, hidden_states, attention_mask=None, head_mask=None,
                encoder_hidden_states=None, encoder_attention_mask=None,
                past_key_values=None, output_attentions=False,
                cache_position=None, **kwargs):

        batch_size = hidden_states.size(0)

        def split(x):
            return (x.view(batch_size, -1, self.num_attention_heads,
                           self.attention_head_size).transpose(1, 2))

        query_layer = split(self.query(hidden_states))
        key_layer   = split(self.key(hidden_states))
        value_layer = split(self.value(hidden_states))

        diff             = query_layer.unsqueeze(3) - key_layer.unsqueeze(2)
        attention_scores = diff.abs().sum(dim=-1) * L1_LAMBDA
        attention_scores = attention_scores / math.sqrt(self.attention_head_size)

        if attention_mask is not None:
            attention_scores = attention_scores + attention_mask

        attention_probs = nn.functional.softmax(attention_scores, dim=-1)
        attention_probs = self.dropout(attention_probs)

        if head_mask is not None:
            attention_probs = attention_probs * head_mask

        context_layer = torch.matmul(attention_probs, value_layer)
        context_layer = context_layer.transpose(1, 2).contiguous()
        context_layer = context_layer.view(batch_size, -1, self.all_head_size)

        outputs = (context_layer, attention_probs) if output_attentions else (context_layer,)
        return outputs


# ══════════════════════════════════════════════════════════════════════════════
# PART D: Wiring — L1 versions of Attention, Layer, Encoder, Model
# ══════════════════════════════════════════════════════════════════════════════

class L1BigBirdAttention(BigBirdAttention):
    def __init__(self, config, seed=None):
        super().__init__(config, seed=seed)
        if config.attention_type == "original_full":
            self.self = L1BigBirdSelfAttention(config, layer_idx=seed)
        else:
            self.self = L1BigBirdBlockSparseAttention(config, seed)

    def set_attention_type(self, value: str, layer_idx=None):
        if value == self.attention_type:
            return
        self.attention_type = value
        if value == "original_full":
            attn = L1BigBirdSelfAttention(self.config, layer_idx=layer_idx)
        else:
            attn = L1BigBirdBlockSparseAttention(self.config, self.seed)
        attn.query = self.self.query
        attn.key   = self.self.key
        attn.value = self.self.value
        self.self  = attn
        if not self.training:
            self.self.eval()


class L1BigBirdLayer(BigBirdLayer):
    def __init__(self, config, seed=None):
        super().__init__(config, seed=seed)
        self.attention = L1BigBirdAttention(config, seed=seed)


class L1BigBirdEncoder(BigBirdEncoder):
    def __init__(self, config):
        super().__init__(config)
        self.layer = nn.ModuleList(
            [L1BigBirdLayer(config, seed=i)
             for i in range(config.num_hidden_layers)]
        )


class L1BigBirdModel(BigBirdModel):
    def __init__(self, config, add_pooling_layer=True):
        super().__init__(config, add_pooling_layer=add_pooling_layer)
        self.encoder = L1BigBirdEncoder(config)
        self.post_init()


# ══════════════════════════════════════════════════════════════════════════════
# PART E: Classification head
# ══════════════════════════════════════════════════════════════════════════════

class L1BigBirdForSequenceClassification(BigBirdPreTrainedModel):
    """
    L1-BigBird with a 2-layer MLP classifier on the [CLS] token.
    LayerNorm → Linear(768,256) → GELU → Dropout(0.3) → Linear(256,2)
    """

    def __init__(self, config):
        super().__init__(config)
        self.num_labels = config.num_labels
        self.bert       = L1BigBirdModel(config, add_pooling_layer=False)
        hidden          = config.hidden_size
        self.classifier = nn.Sequential(
            nn.LayerNorm(hidden),
            nn.Linear(hidden, 256),
            nn.GELU(),
            nn.Dropout(0.3),
            nn.Linear(256, self.num_labels),
        )
        self.post_init()

    def forward(self, input_ids=None, attention_mask=None, token_type_ids=None,
                position_ids=None, inputs_embeds=None, labels=None,
                output_attentions=None, output_hidden_states=None,
                return_dict=None):

        outputs = self.bert(
            input_ids,
            attention_mask=attention_mask,
            token_type_ids=token_type_ids,
            position_ids=position_ids,
            inputs_embeds=inputs_embeds,
            output_attentions=output_attentions,
            output_hidden_states=output_hidden_states,
            return_dict=return_dict,
        )

        cls_hidden = outputs[0][:, 0, :]        # [CLS] representation
        logits     = self.classifier(cls_hidden)

        loss = None
        if labels is not None:
            loss = nn.CrossEntropyLoss()(logits, labels)

        from types import SimpleNamespace
        return SimpleNamespace(loss=loss, logits=logits)


# ══════════════════════════════════════════════════════════════════════════════
# PART F: IMDb Dataset
# ══════════════════════════════════════════════════════════════════════════════

class IMDbDataset(Dataset):
    """
    IMDb wrapper for BigBird.

    IMDb reviews use the "text" field (vs SST-2's "sentence").
    Truncated/padded to max_length tokens. At max_length=512 BigBird will
    use original_full; at max_length >= 1024 it switches to block_sparse.
    """

    def __init__(self, hf_split, tokenizer, max_length: int = MAX_LENGTH):
        self.data       = hf_split
        self.tokenizer  = tokenizer
        self.max_length = max_length

    def __len__(self):
        return len(self.data)

    def __getitem__(self, idx):
        enc = self.tokenizer(
            self.data[idx]["text"],          # IMDb field is "text", not "sentence"
            truncation=True,
            padding="max_length",
            max_length=self.max_length,
            return_tensors="pt",
        )
        return {
            "input_ids":      enc["input_ids"].squeeze(0),
            "attention_mask": enc["attention_mask"].squeeze(0),
            "labels":         torch.tensor(self.data[idx]["label"], dtype=torch.long),
        }


# ══════════════════════════════════════════════════════════════════════════════
# PART G: Training and evaluation loops
# ══════════════════════════════════════════════════════════════════════════════

def train_epoch(model, loader, optimizer, scheduler, scaler, device):
    model.train()
    total_loss = total_correct = total_examples = 0

    for batch in loader:
        input_ids      = batch["input_ids"].to(device)
        attention_mask = batch["attention_mask"].to(device)
        labels         = batch["labels"].to(device)

        optimizer.zero_grad()

        with autocast(device_type="cuda", dtype=torch.bfloat16):
            outputs = model(input_ids=input_ids,
                            attention_mask=attention_mask,
                            labels=labels)
            loss = outputs.loss

        scaler.scale(loss).backward()
        scaler.unscale_(optimizer)
        torch.nn.utils.clip_grad_norm_(model.parameters(), max_norm=1.0)
        scaler.step(optimizer)
        scaler.update()
        scheduler.step()

        total_loss     += loss.item()
        preds           = torch.argmax(outputs.logits, dim=1)
        total_correct  += (preds == labels).sum().item()
        total_examples += labels.size(0)

    return total_loss / len(loader), total_correct / total_examples


@torch.no_grad()
def evaluate(model, loader, device, split_name="Val"):
    model.eval()
    loss_fn = nn.CrossEntropyLoss()
    total_loss = total_correct = total_examples = 0

    for batch in loader:
        input_ids      = batch["input_ids"].to(device)
        attention_mask = batch["attention_mask"].to(device)
        labels         = batch["labels"].to(device)

        outputs = model(input_ids=input_ids, attention_mask=attention_mask)
        logits  = outputs.logits

        total_loss     += loss_fn(logits, labels).item()
        preds           = torch.argmax(logits, dim=1)
        total_correct  += (preds == labels).sum().item()
        total_examples += labels.size(0)

    avg_loss = total_loss / len(loader)
    accuracy = total_correct / total_examples
    print(f"  {split_name} → Loss: {avg_loss:.4f}, Accuracy: {accuracy:.4f}")
    return avg_loss, accuracy


# ══════════════════════════════════════════════════════════════════════════════
# PART H: Argument parsing + Main
# ══════════════════════════════════════════════════════════════════════════════

def parse_args():
    p = argparse.ArgumentParser(
        description="L1-BigBird training on IMDb sentiment")
    p.add_argument("--model_path", default="google/bigbird-roberta-base",
                   help="HuggingFace model id or local path (default: google/bigbird-roberta-base)")
    p.add_argument("--save_path", default="./best_bigbird_l1_imdb",
                   help="Directory to save best checkpoint (default: ./best_bigbird_l1_imdb)")
    p.add_argument("--max_length", type=int, default=512,
                   help="Max token length. <704 → original_full; ≥1024 → block_sparse (default: 512)")
    p.add_argument("--batch_size", type=int, default=4,
                   help="Train batch size (default: 4; use 2 for max_length=1024)")
    p.add_argument("--eval_batch_size", type=int, default=8,
                   help="Eval batch size (default: 8)")
    p.add_argument("--epochs", type=int, default=10,
                   help="Max training epochs (default: 10)")
    p.add_argument("--patience", type=int, default=3,
                   help="Early stopping patience (default: 3)")
    p.add_argument("--lr", type=float, default=2e-5,
                   help="AdamW learning rate (default: 2e-5)")
    p.add_argument("--weight_decay", type=float, default=0.01,
                   help="AdamW weight decay (default: 0.01)")
    p.add_argument("--scratch", action="store_true",
                   help="Train from scratch (random weights) instead of pretrained")
    p.add_argument("--num_layers", type=int, default=12,
                   help="Number of transformer layers (default: 12 — full base)")
    return p.parse_args()


def main():
    args   = parse_args()
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

    # block_sparse threshold = (5 + 2 * num_random_blocks) * block_size = 704
    block_sparse_threshold = (5 + 2 * 3) * 64
    attn_mode = "block_sparse" if args.max_length >= block_sparse_threshold else "original_full"

    print(f"Using device    : {device}")
    print(f"Base model      : {args.model_path}")
    print(f"Save path       : {args.save_path}")
    print(f"Max length      : {args.max_length}")
    print(f"Attention mode  : {attn_mode} (threshold={block_sparse_threshold})")
    print(f"Batch size      : {args.batch_size} (train)  {args.eval_batch_size} (eval)")

    # ── Tokenizer ─────────────────────────────────────────────────────────────
    tokenizer = BigBirdTokenizer.from_pretrained(args.model_path)

    # ── Dataset ───────────────────────────────────────────────────────────────
    print("\nLoading IMDb …")
    data       = load_dataset("imdb")
    train_data = IMDbDataset(data["train"], tokenizer, max_length=args.max_length)
    val_data   = IMDbDataset(data["test"],  tokenizer, max_length=args.max_length)

    train_loader = DataLoader(train_data, batch_size=args.batch_size, shuffle=True,
                              collate_fn=default_data_collator, num_workers=2,
                              pin_memory=True)
    val_loader   = DataLoader(val_data, batch_size=args.eval_batch_size,
                              collate_fn=default_data_collator, num_workers=2,
                              pin_memory=True)

    print(f"Train: {len(train_data):,}  |  Test (used as val): {len(val_data):,}")

    # ── Model config ──────────────────────────────────────────────────────────
    if args.scratch:
        print("\nBuilding model from scratch …")
        config = BigBirdConfig(
            vocab_size=tokenizer.vocab_size,
            hidden_size=768,
            num_hidden_layers=args.num_layers,
            num_attention_heads=12,
            intermediate_size=3072,
            hidden_act="gelu",
            hidden_dropout_prob=0.1,
            attention_probs_dropout_prob=0.1,
            max_position_embeddings=4096,
            type_vocab_size=2,
            block_size=64,
            num_random_blocks=3,
            attention_type="block_sparse",
            use_bias=True,
            rescale_embeddings=False,
            num_labels=2,
            pad_token_id=tokenizer.pad_token_id,
        )
        model = L1BigBirdForSequenceClassification(config)
        model.resize_token_embeddings(len(tokenizer))
    else:
        print(f"\nLoading pretrained weights from {args.model_path} …")
        base_config = BigBirdConfig.from_pretrained(args.model_path)
        base_config.num_labels                    = 2
        base_config.num_hidden_layers             = args.num_layers
        base_config.pad_token_id                  = tokenizer.pad_token_id
        base_config.attention_type                = "block_sparse"
        base_config.hidden_dropout_prob           = 0.1
        base_config.attention_probs_dropout_prob  = 0.1
        # from_pretrained on the custom class loads backbone weights and
        # skips the classifier head automatically (ignore_mismatched_sizes=True)
        model = L1BigBirdForSequenceClassification.from_pretrained(
            args.model_path, config=base_config, ignore_mismatched_sizes=True)

    model = model.to(device)
    n_params = sum(p.numel() for p in model.parameters())
    print(f"Model parameters: {n_params:,}")
    print(f"Effective attention mode: {attn_mode}")

    # ── Optimiser + scheduler ─────────────────────────────────────────────────
    NUM_EPOCHS   = args.epochs
    PATIENCE     = args.patience
    WARMUP_STEPS = len(train_loader)           # 1 epoch warm-up
    TOTAL_STEPS  = NUM_EPOCHS * len(train_loader)

    optimizer = torch.optim.AdamW(
        model.parameters(), lr=args.lr, weight_decay=args.weight_decay,
        betas=(0.9, 0.999))
    scheduler = get_cosine_schedule_with_warmup(
        optimizer, num_warmup_steps=WARMUP_STEPS,
        num_training_steps=TOTAL_STEPS)
    scaler = GradScaler()

    # ── Training loop ─────────────────────────────────────────────────────────
    best_val_acc      = 0.0
    epochs_no_improve = 0

    print()
    for epoch in range(1, NUM_EPOCHS + 1):
        train_loss, train_acc = train_epoch(
            model, train_loader, optimizer, scheduler, scaler, device)
        print(f"Epoch {epoch}/{NUM_EPOCHS}  "
              f"Train Loss: {train_loss:.4f}  Train Acc: {train_acc:.4f}")
        val_loss, val_acc = evaluate(model, val_loader, device)

        if val_acc > best_val_acc:
            best_val_acc = val_acc
            model.save_pretrained(args.save_path)
            tokenizer.save_pretrained(args.save_path)
            print(f"  ✓ Best val acc: {best_val_acc:.4f} — saved to {args.save_path}")
            epochs_no_improve = 0
        else:
            epochs_no_improve += 1
            print(f"  No improvement ({epochs_no_improve}/{PATIENCE})")
            if epochs_no_improve >= PATIENCE:
                print("Early stopping triggered.")
                break

    # ── Final eval with best checkpoint ───────────────────────────────────────
    print(f"\nLoading best checkpoint from {args.save_path} …")
    best = L1BigBirdForSequenceClassification.from_pretrained(args.save_path)
    best.config.pad_token_id = tokenizer.pad_token_id
    best = best.to(device)
    evaluate(best, val_loader, device, "Best model (Test)")


if __name__ == "__main__":
    main()