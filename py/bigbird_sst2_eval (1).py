"""
EcoTransformer — L1 BigBird: Multi-Precision Evaluation Script
===============================================================
Loads a saved L1-BigBird model (from bigbird_sst2_eval.py) and
evaluates it on SST-2 validation set across four precisions:

  1. FP32  – full float32 baseline
  2. BF16  – bfloat16 (same dynamic range as FP32, half the memory)
  3. FP16  – float16  (smaller range, watch for overflow/NaN)
  4. INT8  – 8-bit quantization via bitsandbytes

Per precision the script reports:
  - Accuracy
  - Loss
  - Inference latency (ms / batch)
  - Peak GPU memory (MB)
  - NaN / Inf batch count

BigBird-specific details handled here:
  - No global_attention_mask needed (BigBird uses first/last blocks as globals)
  - seq_len auto-switches to original_full when < (5+2*num_random_blocks)*block_size
  - Tokenizer is BigBirdTokenizer (SentencePiece vocab, same as RoBERTa)
  - MAX_LENGTH=64 — BigBird will use original_full path for all SST-2 sequences

Usage:
    python bigbird_sst2_eval.py
    python bigbird_sst2_eval.py --model_path ./best_bigbird_l1
    python bigbird_sst2_eval.py --batch_size 16 --skip_int8

Requirements:
    pip install transformers datasets torch bitsandbytes
"""

import os
import time
import math
import argparse
import numpy as np

import torch
import torch.nn as nn
from torch.utils.data import DataLoader, Dataset
from transformers import (
    BigBirdConfig,
    BigBirdTokenizer,
    BitsAndBytesConfig,
    default_data_collator,
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
from datasets import load_dataset

hf_logging.set_verbosity_error()

# ── Must match training constants exactly ─────────────────────────────────────
MAX_LENGTH = 64    # BigBird auto-switches to original_full for seq_len < 704
L1_LAMBDA  = -0.1


# ══════════════════════════════════════════════════════════════════════════════
# Model definition — identical to bigbird_sst2_eval.py (training script)
# Must be present so from_pretrained can reconstruct the custom architecture.
# ══════════════════════════════════════════════════════════════════════════════

def l1_bmm_nd(query: torch.Tensor, key: torch.Tensor, ndim: int) -> torch.Tensor:
    """
    L1-distance replacement for BigBird's torch_bmm_nd_transpose.

    torch_bmm_nd_transpose(Q, K, ndim) computes  Q · Kᵀ  for n-d tensors by
    flattening the leading dims into the batch dimension, doing a batched
    matmul, then reshaping back.

    We compute  -λ · Σ|Q - K|  using the same flatten/reshape strategy so
    the output shape is identical.

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

    diff   = q_flat.unsqueeze(2) - k_flat.unsqueeze(1)               # (N, q, k, d)
    scores = diff.abs().sum(dim=-1) * L1_LAMBDA                      # (N, q, k)

    return scores.view(leading + (query.shape[-2], key.shape[-2]))


def l1_einsum_bhlqk(query: torch.Tensor, key: torch.Tensor) -> torch.Tensor:
    """
    L1 replacement for the two global-band einsum calls in bigbird_block_sparse_attention:

        torch.einsum("bhlqd,bhkd->bhlqk", middle_query, global_key)

    Shapes:
        query : (bsz, n_heads, n_chunks, q_block, head_dim)
        key   : (bsz, n_heads,           k_block, head_dim)
        out   : (bsz, n_heads, n_chunks, q_block, k_block)
    """
    key_exp = key.unsqueeze(2)
    diff = query.unsqueeze(4) - key_exp.unsqueeze(3)   # (B,H,L,q,k,d)
    return diff.abs().sum(dim=-1) * L1_LAMBDA           # (B,H,L,q,k)


class L1BigBirdBlockSparseAttention(BigBirdBlockSparseAttention):
    """
    BigBird block-sparse attention with L1 distance replacing all dot products.

    Only two things are overridden:
      1. torch_bmm_nd_transpose  — used for window, random, first, last blocks
      2. bigbird_block_sparse_attention — two global einsum lines patched inline

    All random-mask generation, chunking, and value-weighting is inherited.
    """

    @staticmethod
    def torch_bmm_nd_transpose(inp_1: torch.Tensor,
                                inp_2: torch.Tensor,
                                ndim:  int = None) -> torch.Tensor:
        """Drop-in for Q·Kᵀ → L1 distance."""
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
        """
        Identical to the parent implementation except the two global einsum
        calls are replaced with l1_einsum_bhlqk.

        The two lines changed (marked with ← L1):
          first_band_product  = torch.einsum("bhlqd,bhkd->bhlqk", ...)
          last_band_product   = torch.einsum("bhlqd,bhkd->bhlqk", ...)
        """
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


class L1BigBirdSelfAttention(BigBirdSelfAttention):
    """
    Full-sequence L1 attention for BigBird's `original_full` mode.
    Replaces the standard Q·Kᵀ matmul with L1 pairwise distance.
    """

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

        attention_probs  = nn.functional.softmax(attention_scores, dim=-1)
        attention_probs  = self.dropout(attention_probs)

        if head_mask is not None:
            attention_probs = attention_probs * head_mask

        context_layer = torch.matmul(attention_probs, value_layer)
        context_layer = context_layer.transpose(1, 2).contiguous()
        context_layer = context_layer.view(batch_size, -1, self.all_head_size)

        outputs = (context_layer, attention_probs) if output_attentions else (context_layer,)
        return outputs


class L1BigBirdAttention(BigBirdAttention):
    """
    BigBirdAttention with both attention modes replaced by L1 variants.
    BigBirdAttention picks between `original_full` and `block_sparse`
    at runtime; we swap both so L1 is active in either mode.
    """

    def __init__(self, config, seed=None):
        super().__init__(config, seed=seed)
        if config.attention_type == "original_full":
            self.self = L1BigBirdSelfAttention(config, layer_idx=seed)
        else:
            self.self = L1BigBirdBlockSparseAttention(config, seed)

    def set_attention_type(self, value: str, layer_idx=None):
        """Called by BigBirdModel when it auto-switches to original_full."""
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


class L1BigBirdForSequenceClassification(BigBirdPreTrainedModel):
    """L1-BigBird classification head — identical to training script."""

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
# Dataset
# ══════════════════════════════════════════════════════════════════════════════

class SST2Dataset(Dataset):
    """
    SST-2 wrapper for BigBird.
    seq_len is padded to MAX_LENGTH=64 which is below the block_sparse threshold
    (704), so BigBirdModel will always use the original_full attention path.
    """

    def __init__(self, hf_split, tokenizer, max_length: int = MAX_LENGTH):
        self.data       = hf_split
        self.tokenizer  = tokenizer
        self.max_length = max_length

    def __len__(self):
        return len(self.data)

    def __getitem__(self, idx):
        enc = self.tokenizer(
            self.data[idx]["sentence"],
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
# Evaluation engine
# ══════════════════════════════════════════════════════════════════════════════

def reset_gpu_stats():
    if torch.cuda.is_available():
        torch.cuda.empty_cache()
        torch.cuda.reset_peak_memory_stats()


def peak_gpu_mb() -> float:
    if torch.cuda.is_available():
        return torch.cuda.max_memory_allocated() / 1024 ** 2
    return 0.0


def sync():
    if torch.cuda.is_available():
        torch.cuda.synchronize()


@torch.no_grad()
def evaluate_model(model, loader, device,
                   cast_dtype=None, label: str = "FP32") -> dict:
    """
    Run full validation loop for one precision setting.

    cast_dtype : torch.bfloat16 / torch.float16 for BF16/FP16 (uses autocast)
                 None for FP32 and INT8 (model weights already in target dtype)

    BigBird note: unlike Longformer, no global_attention_mask is needed here —
    BigBird handles global tokens internally via its first/last block design.
    """
    model.eval()
    loss_fn = nn.CrossEntropyLoss()

    total_loss = total_correct = total_examples = 0
    nan_batches = inf_batches = 0
    latencies = []

    reset_gpu_stats()

    for batch in loader:
        input_ids      = batch["input_ids"].to(device)
        attention_mask = batch["attention_mask"].to(device)
        labels         = batch["labels"].to(device)

        sync()
        t0 = time.perf_counter()

        if cast_dtype is not None:
            with torch.autocast(device_type="cuda", dtype=cast_dtype):
                outputs = model(
                    input_ids=input_ids,
                    attention_mask=attention_mask,
                )
        else:
            outputs = model(
                input_ids=input_ids,
                attention_mask=attention_mask,
            )

        sync()
        latencies.append((time.perf_counter() - t0) * 1000)

        # Cast logits to FP32 for stable loss / accuracy computation
        logits = outputs.logits.float()

        has_nan = torch.isnan(logits).any().item()
        has_inf = torch.isinf(logits).any().item()
        if has_nan: nan_batches += 1
        if has_inf: inf_batches += 1

        if not (has_nan or has_inf):
            total_loss    += loss_fn(logits, labels).item()
            total_correct += (torch.argmax(logits, dim=1) == labels).sum().item()

        total_examples += labels.size(0)

    valid    = len(loader) - nan_batches - inf_batches
    avg_loss = total_loss / valid if valid > 0 else float("nan")
    accuracy = total_correct / total_examples

    return {
        "label":         label,
        "accuracy":      accuracy,
        "loss":          avg_loss,
        "latency_ms":    float(np.mean(latencies)),
        "peak_mem_mb":   peak_gpu_mb(),
        "nan_batches":   nan_batches,
        "inf_batches":   inf_batches,
        "total_batches": len(loader),
    }


# ══════════════════════════════════════════════════════════════════════════════
# Results display
# ══════════════════════════════════════════════════════════════════════════════

def print_table(results: list):
    W = 84
    print("\n" + "=" * W)
    print(f"{'PRECISION COMPARISON — L1-BigBird on SST-2 Validation':^{W}}")
    print("=" * W)
    print(f"{'Precision':<10} {'Accuracy':>10} {'Loss':>10} "
          f"{'Latency(ms)':>13} {'PeakMem(MB)':>13} {'Numerical':>10}")
    print("-" * W)

    for r in results:
        if r["nan_batches"] or r["inf_batches"]:
            flag = f"⚠ {r['nan_batches']}NaN {r['inf_batches']}Inf"
        else:
            flag = "✓ clean"
        print(f"{r['label']:<10} "
              f"{r['accuracy']:>9.4f}  "
              f"{r['loss']:>9.4f}  "
              f"{r['latency_ms']:>12.2f}  "
              f"{r['peak_mem_mb']:>12.1f}  "
              f"  {flag}")

    print("=" * W)

    best     = max(results, key=lambda x: x["accuracy"])
    fastest  = min(results, key=lambda x: x["latency_ms"])
    lightest = min(results, key=lambda x: x["peak_mem_mb"])

    print(f"\n  🏆 Best accuracy  : {best['label']}   ({best['accuracy']:.4f})")
    print(f"  ⚡ Fastest         : {fastest['label']}   ({fastest['latency_ms']:.2f} ms/batch)")
    print(f"  💾 Least memory   : {lightest['label']}   ({lightest['peak_mem_mb']:.1f} MB)")

    # Accuracy drop from FP32 baseline
    fp32 = next((r for r in results if r["label"] == "FP32"), None)
    if fp32:
        print("\n  Accuracy drop vs FP32:")
        for r in results:
            if r["label"] == "FP32":
                continue
            drop = fp32["accuracy"] - r["accuracy"]
            sign = "-" if drop >= 0 else "+"
            print(f"    {r['label']:<8} {sign}{abs(drop)*100:.2f}%")
    print()


# ══════════════════════════════════════════════════════════════════════════════
# Main
# ══════════════════════════════════════════════════════════════════════════════

def parse_args():
    p = argparse.ArgumentParser(
        description="Multi-precision eval for L1-BigBird on SST-2")
    p.add_argument("--model_path", default="./best_bigbird_l1",
                   help="Path to saved model dir (default: ./best_bigbird_l1)")
    p.add_argument("--batch_size", type=int, default=8,
                   help="Eval batch size (default: 8)")
    p.add_argument("--max_length", type=int, default=64,
                   help="Token length — must match training (default: 64). "
                        "BigBird uses original_full for seq_len < 704.")
    p.add_argument("--skip_int8", action="store_true",
                   help="Skip INT8 eval (if bitsandbytes is not installed)")
    p.add_argument("--skip_fp16", action="store_true",
                   help="Skip FP16 eval (useful if GPU doesn't support it well)")
    return p.parse_args()


def load_model(model_path: str, torch_dtype=None,
               quantization_config=None) -> L1BigBirdForSequenceClassification:
    """Load the custom L1-BigBird from a saved directory."""
    kwargs = {}
    if torch_dtype is not None:
        kwargs["torch_dtype"] = torch_dtype
    if quantization_config is not None:
        kwargs["quantization_config"] = quantization_config
        kwargs["device_map"] = "auto"
    return L1BigBirdForSequenceClassification.from_pretrained(
        model_path, **kwargs)


def main():
    args   = parse_args()
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    print(f"Using device : {device}")
    print(f"Model path   : {args.model_path}")
    print(f"Batch size   : {args.batch_size}")
    print(f"Max length   : {args.max_length}")
    print(f"Attention mode: original_full (seq_len={args.max_length} < 704 block_sparse threshold)")

    # ── Tokenizer ─────────────────────────────────────────────────────────────
    tokenizer = BigBirdTokenizer.from_pretrained(args.model_path)

    # ── Dataset ───────────────────────────────────────────────────────────────
    print("\nLoading SST-2 validation split …")
    data     = load_dataset("stanfordnlp/sst2")
    val_data = SST2Dataset(data["validation"], tokenizer,
                           max_length=args.max_length)
    loader   = DataLoader(val_data, batch_size=args.batch_size,
                          collate_fn=default_data_collator, num_workers=2)
    print(f"Validation samples : {len(val_data):,}  |  Batches: {len(loader):,}")

    results = []

    # ══════════════════════════════════════════════════════════════════════════
    # 1. FP32 — full precision baseline
    # ══════════════════════════════════════════════════════════════════════════
    print("\n── [1/4] FP32 ───────────────────────────────────────────────────────")
    model = load_model(args.model_path)
    model = model.float().to(device).eval()

    r = evaluate_model(model, loader, device, cast_dtype=None, label="FP32")
    results.append(r)
    print(f"  Acc: {r['accuracy']:.4f}  Loss: {r['loss']:.4f}  "
          f"Latency: {r['latency_ms']:.1f} ms/batch  Mem: {r['peak_mem_mb']:.0f} MB")
    del model; reset_gpu_stats()

    # ══════════════════════════════════════════════════════════════════════════
    # 2. BF16 — bfloat16 (recommended over FP16 for L1 distances)
    # ══════════════════════════════════════════════════════════════════════════
    print("\n── [2/4] BF16 ───────────────────────────────────────────────────────")
    if not torch.cuda.is_bf16_supported():
        print("  ⚠ BF16 not supported on this GPU — skipping.")
    else:
        model = load_model(args.model_path, torch_dtype=torch.bfloat16)
        model = model.to(device).eval()

        r = evaluate_model(model, loader, device,
                           cast_dtype=torch.bfloat16, label="BF16")
        results.append(r)
        print(f"  Acc: {r['accuracy']:.4f}  Loss: {r['loss']:.4f}  "
              f"Latency: {r['latency_ms']:.1f} ms/batch  Mem: {r['peak_mem_mb']:.0f} MB")
        del model; reset_gpu_stats()

    # ══════════════════════════════════════════════════════════════════════════
    # 3. FP16 — float16 (may overflow; L1 sums can be large)
    # ══════════════════════════════════════════════════════════════════════════
    print("\n── [3/4] FP16 ───────────────────────────────────────────────────────")
    if args.skip_fp16:
        print("  Skipped (--skip_fp16).")
    else:
        model = load_model(args.model_path, torch_dtype=torch.float16)
        model = model.to(device).eval()

        r = evaluate_model(model, loader, device,
                           cast_dtype=torch.float16, label="FP16")
        results.append(r)
        print(f"  Acc: {r['accuracy']:.4f}  Loss: {r['loss']:.4f}  "
              f"Latency: {r['latency_ms']:.1f} ms/batch  Mem: {r['peak_mem_mb']:.0f} MB")

        if r["nan_batches"] or r["inf_batches"]:
            print(f"  ⚠  {r['nan_batches']} NaN batches, {r['inf_batches']} Inf batches detected.")
            print("     FP16 max value (~65504) can be exceeded by L1 distance sums.")
            print("     Use BF16 instead.")
        del model; reset_gpu_stats()

    # ══════════════════════════════════════════════════════════════════════════
    # 4. INT8 — bitsandbytes 8-bit quantization
    # ══════════════════════════════════════════════════════════════════════════
    print("\n── [4/4] INT8 ───────────────────────────────────────────────────────")
    if args.skip_int8:
        print("  Skipped (--skip_int8).")
    else:
        try:
            import bitsandbytes  # noqa: F401
            quant_cfg = BitsAndBytesConfig(load_in_8bit=True)
            model     = load_model(args.model_path,
                                   quantization_config=quant_cfg)
            model.eval()
            int8_device = next(model.parameters()).device

            r = evaluate_model(model, loader, int8_device,
                               cast_dtype=None, label="INT8")
            results.append(r)
            print(f"  Acc: {r['accuracy']:.4f}  Loss: {r['loss']:.4f}  "
                  f"Latency: {r['latency_ms']:.1f} ms/batch  Mem: {r['peak_mem_mb']:.0f} MB")
            del model; reset_gpu_stats()

        except ImportError:
            print("  ⚠ bitsandbytes not installed.")
            print("    Install with: pip install bitsandbytes")
        except Exception as e:
            print(f"  ⚠ INT8 failed: {e}")

    # ── Final comparison table ─────────────────────────────────────────────────
    print_table(results)


if __name__ == "__main__":
    main()