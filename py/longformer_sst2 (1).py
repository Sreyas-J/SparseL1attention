"""
EcoTransformer: L1-Longformer for SST-2 Sentiment Classification
=================================================================

WHY LONGFORMER IS A NATURAL FIT FOR L1 ATTENTION
-------------------------------------------------
Standard Longformer already uses a sliding-window attention pattern:
  - Each token only attends to `attention_window` neighbours (local attention)
  - A small set of [CLS] / task tokens get *global* attention (see every token)
  - This gives O(n * w) complexity instead of O(n²)

The dot-product Q·Kᵀ lives inside one method: _sliding_chunks_query_key_matmul
We replace that single einsum with chunked L1 distances.
Everything else (chunking, masking, global attention, value weighting) is
kept exactly as Longformer designed it.

WHAT CHANGES vs THE GPT-2 SCRIPT
---------------------------------
  GPT-2 L1  → full-sequence L1 distance (O(n²) memory) + additive window mask
  Longformer L1 → chunked L1 distance (O(n·w) memory) — window is structural,
                  not a post-hoc mask, so it's cheaper and more principled.

GLOBAL ATTENTION
-----------------
Longformer's global attention (used for [CLS] token) keeps the original
dot-product. That's intentional — global tokens attend to *all* positions and
the dot-product is a single small matmul. Replacing it with L1 is optional
and yields no efficiency gain for the global path.

ARCHITECTURE (from_scratch, not fine-tuned from pretrained weights)
-----------------------------------------------------------------
  hidden_size:        768
  num_hidden_layers:  6      (reduced from 12 to fit on one GPU)
  num_attention_heads: 12
  attention_window:   [512] * 6   (each layer has a 512-token window)
  max_position_embeddings: 4096   (Longformer's strength — long sequences)
  num_labels:         2           (SST-2 binary)

ANTI-OVERFITTING FIXES (same as the GPT-2 SST-2 script)
  - 2-layer MLP classifier head with Dropout(0.3)
  - AdamW lr=1e-4, weight_decay=0.1
  - Linear warmup + cosine LR schedule
  - Gradient clipping (max_norm=1.0)
  - Early stopping (patience=3)
  - Best checkpoint saving

Run on a machine with a CUDA GPU.
"""

# ── Imports ───────────────────────────────────────────────────────────────────
import os
import math

cache_dir = os.path.expanduser("~/huggingface")
os.environ["HF_DATASETS_CACHE"] = os.path.join(cache_dir, "datasets")
os.environ["HF_HOME"]           = os.path.join(cache_dir, "home")
os.environ["CUDA_LAUNCH_BLOCKING"] = "1"

import torch
import torch.nn as nn
from torch.utils.data import DataLoader, Dataset
from torch.amp import GradScaler, autocast

from datasets import load_dataset
from transformers import (
    LongformerConfig,
    LongformerTokenizer,
    default_data_collator,
    get_linear_schedule_with_warmup,
    BitsAndBytesConfig,
)
from transformers.models.longformer.modeling_longformer import (
    LongformerSelfAttention,
    LongformerAttention,
    LongformerLayer,
    LongformerEncoder,
    LongformerModel,
    LongformerPreTrainedModel,
    LongformerForSequenceClassification,
)
from transformers.utils import logging as hf_logging

hf_logging.set_verbosity_error()

# ── Constants ─────────────────────────────────────────────────────────────────
MAX_LENGTH  = 256    # Longformer can handle much longer; 512 covers all SST-2
L1_LAMBDA   = -0.1  # Negative: smaller L1 dist → higher score.
                     # Longformer already scales Q by 1/√d before chunking,
                     # so we use a smaller lambda than the GPT-2 script (was -3).


# ══════════════════════════════════════════════════════════════════════════════
# PART A: Chunked L1 distance — replaces torch.einsum("bcxd,bcyd->bcxy",Q,K)
# ══════════════════════════════════════════════════════════════════════════════

def chunked_l1_scores(query_chunks: torch.Tensor,
                      key_chunks: torch.Tensor) -> torch.Tensor:
    """
    Compute pairwise L1 distances between every query chunk position and
    every key chunk position — a direct drop-in for the einsum in
    _sliding_chunks_query_key_matmul.

    Shapes (matching Longformer's internal chunked layout):
        query_chunks : (batch*heads, chunks, 2w, head_dim)
        key_chunks   : (batch*heads, chunks, 2w, head_dim)
        output       : (batch*heads, chunks, 2w, 2w)

    Memory note: this materialises a (2w × 2w × head_dim) tensor per chunk,
    which is equivalent to the original einsum cost — no worse.
    """
    # query_chunks[:,:,:,None,:] → (B*H, chunks, 2w, 1,  d)
    # key_chunks  [:,:,None,:,:] → (B*H, chunks, 1,  2w, d)
    # diff                       → (B*H, chunks, 2w, 2w, d)
    diff = query_chunks.unsqueeze(3) - key_chunks.unsqueeze(2)  # broadcast
    l1   = diff.abs().sum(dim=-1)                               # (B*H, chunks, 2w, 2w)
    return l1 * L1_LAMBDA


# ══════════════════════════════════════════════════════════════════════════════
# PART B: Patched LongformerSelfAttention with L1 local scores
# ══════════════════════════════════════════════════════════════════════════════

class L1LongformerSelfAttention(LongformerSelfAttention):
    """
    Longformer self-attention with L1 distance replacing dot-product
    for the LOCAL (sliding-window) attention path.

    Only one internal method is replaced:
        _sliding_chunks_query_key_matmul  ← chunked L1 instead of einsum

    Everything else is inherited unchanged:
        _sliding_chunks_matmul_attn_probs_value  (value weighting)
        _compute_global_attn_output_from_hidden  (global attention, dot-product kept)
        _mask_invalid_locations                  (causal / padding masks)
        _chunk / _pad_and_diagonalize            (chunking utilities)
        forward                                  (overall flow)
    """

    def _sliding_chunks_query_key_matmul(self,
                                          query: torch.Tensor,
                                          key:   torch.Tensor,
                                          window_overlap: int) -> torch.Tensor:
        """
        L1-distance replacement for Longformer's sliding-window Q·Kᵀ.

        Longformer calls this with:
            query / key: (batch, seq, heads, head_dim)   [already scaled by 1/√d]
        Returns:
            (batch, seq, heads, 2*window_overlap+1)      — same as original

        Internal steps (identical to original except the score formula):
          1. Reshape to (batch*heads, seq, head_dim)
          2. Chunk both into overlapping windows via self._chunk()
          3. Compute L1 scores for each (query_chunk × key_chunk) pair
          4. Reassemble the diagonal attention matrix
          5. Apply _mask_invalid_locations to block out-of-window positions
        """
        batch_size, seq_len, num_heads, head_dim = query.size()

        # Longformer requires seq_len to be a multiple of 2*window_overlap
        assert seq_len % (window_overlap * 2) == 0, (
            f"seq_len ({seq_len}) must be a multiple of "
            f"2*window_overlap={window_overlap * 2}"
        )
        assert query.size() == key.size()

        chunks_count = torch.div(seq_len, window_overlap,
                                 rounding_mode="trunc") - 1

        # ── Step 1: merge batch and heads ────────────────────────────────────
        # (batch, seq, heads, dim) → (batch*heads, seq, dim)
        query = query.transpose(1, 2).reshape(
            batch_size * num_heads, seq_len, head_dim)
        key   = key.transpose(1, 2).reshape(
            batch_size * num_heads, seq_len, head_dim)

        # ── Step 2: chunk into overlapping windows ───────────────────────────
        # shape after chunking: (batch*heads, chunks, 2w, head_dim)
        onnx_export = getattr(self.config, "onnx_export", False)
        query = self._chunk(query, window_overlap, onnx_export)
        key   = self._chunk(key,   window_overlap, onnx_export)

        # ── Step 3: L1 scores (replaces einsum dot-product) ──────────────────
        # (batch*heads, chunks, 2w, 2w)
        diagonal_chunked_scores = chunked_l1_scores(query, key)

        # ── Steps 4–5: reassemble diagonal matrix (identical to original) ────
        diagonal_chunked_scores = self._pad_and_transpose_last_two_dims(
            diagonal_chunked_scores, padding=(0, 0, 0, 1)
        )

        diagonal_attention_scores = diagonal_chunked_scores.new_zeros(
            (batch_size * num_heads,
             chunks_count + 1,
             window_overlap,
             window_overlap * 2 + 1)
        )

        # Copy upper triangle
        diagonal_attention_scores[:, :-1, :, window_overlap:] = (
            diagonal_chunked_scores[:, :, :window_overlap, : window_overlap + 1]
        )
        diagonal_attention_scores[:, -1, :, window_overlap:] = (
            diagonal_chunked_scores[:, -1, window_overlap:, : window_overlap + 1]
        )
        # Copy lower triangle
        diagonal_attention_scores[:, 1:, :, :window_overlap] = (
            diagonal_chunked_scores[:, :, -(window_overlap + 1): -1, window_overlap + 1:]
        )
        diagonal_attention_scores[:, 0, 1:window_overlap, 1:window_overlap] = (
            diagonal_chunked_scores[:, 0, : window_overlap - 1, 1 - window_overlap:]
        )

        # Reshape back to (batch, seq, heads, 2w+1)
        diagonal_attention_scores = diagonal_attention_scores.view(
            batch_size, num_heads, seq_len, 2 * window_overlap + 1
        ).transpose(2, 1)

        # Mask out positions beyond the window boundary
        self._mask_invalid_locations(diagonal_attention_scores, window_overlap)
        return diagonal_attention_scores


# ══════════════════════════════════════════════════════════════════════════════
# PART C: Patch LongformerAttention and LongformerLayer to use L1 self-attn
# ══════════════════════════════════════════════════════════════════════════════

class L1LongformerAttention(LongformerAttention):
    """
    LongformerAttention with the self-attention module swapped to L1.
    LongformerAttention = self (LongformerSelfAttention) + output (dense+LN).
    We only replace `self`; output is unchanged.
    """

    def __init__(self, config, layer_id: int = 0):
        super().__init__(config, layer_id=layer_id)
        self.self = L1LongformerSelfAttention(config, layer_id=layer_id)


class L1LongformerLayer(LongformerLayer):
    """Transformer layer with L1 local attention."""

    def __init__(self, config, layer_id: int = 0):
        super().__init__(config, layer_id=layer_id)
        self.attention = L1LongformerAttention(config, layer_id=layer_id)


class L1LongformerEncoder(LongformerEncoder):
    """Stack of L1LongformerLayers."""

    def __init__(self, config):
        super().__init__(config)
        self.layer = nn.ModuleList(
            [L1LongformerLayer(config, layer_id=i)
             for i in range(config.num_hidden_layers)]
        )


class L1LongformerModel(LongformerModel):
    """Full Longformer backbone with L1 local attention in every layer."""

    def __init__(self, config, add_pooling_layer: bool = True):
        super().__init__(config, add_pooling_layer=add_pooling_layer)
        self.encoder = L1LongformerEncoder(config)
        self.post_init()


# ══════════════════════════════════════════════════════════════════════════════
# PART D: Sequence classification head
# ══════════════════════════════════════════════════════════════════════════════

class L1LongformerForSequenceClassification(LongformerPreTrainedModel):
    """
    L1-Longformer for binary/multi-class sequence classification.

    Uses the [CLS] token representation (index 0) as the pooled sentence
    vector — this is Longformer's standard practice and benefits from
    global attention, so [CLS] sees the full sequence even for long inputs.

    Classification head:
        LayerNorm → Linear(hidden, 256) → GELU → Dropout(0.3) → Linear(256, labels)
    """

    def __init__(self, config):
        super().__init__(config)
        self.num_labels  = config.num_labels
        self.longformer  = L1LongformerModel(config, add_pooling_layer=False)

        hidden = config.hidden_size
        self.classifier = nn.Sequential(
            nn.LayerNorm(hidden),
            nn.Linear(hidden, 256),
            nn.GELU(),
            nn.Dropout(0.3),
            nn.Linear(256, self.num_labels),
        )
        self.post_init()

    def forward(self,
                input_ids:             torch.Tensor,
                attention_mask:        torch.Tensor        = None,
                global_attention_mask: torch.Tensor        = None,
                token_type_ids:        torch.Tensor        = None,
                position_ids:          torch.Tensor        = None,
                inputs_embeds:         torch.Tensor        = None,
                labels:                torch.Tensor        = None,
                output_attentions:     bool                = None,
                output_hidden_states:  bool                = None,
                return_dict:           bool                = None):

        # ── Build global attention mask ───────────────────────────────────────
        # [CLS] (position 0) gets global attention so it sees the whole sequence.
        # All other positions attend only within their local window.
        if global_attention_mask is None:
            global_attention_mask = torch.zeros_like(input_ids)
            global_attention_mask[:, 0] = 1   # CLS token → global

        outputs = self.longformer(
            input_ids,
            attention_mask=attention_mask,
            global_attention_mask=global_attention_mask,
            token_type_ids=token_type_ids,
            position_ids=position_ids,
            inputs_embeds=inputs_embeds,
            output_attentions=output_attentions,
            output_hidden_states=output_hidden_states,
            return_dict=return_dict,
        )

        # CLS token hidden state → classifier
        cls_hidden = outputs[0][:, 0, :]   # (batch, hidden_size)
        logits     = self.classifier(cls_hidden)

        loss = None
        if labels is not None:
            loss = nn.CrossEntropyLoss()(logits, labels)

        from types import SimpleNamespace
        return SimpleNamespace(loss=loss, logits=logits)


# ══════════════════════════════════════════════════════════════════════════════
# PART E: SST-2 Dataset
# ══════════════════════════════════════════════════════════════════════════════

class SST2Dataset(Dataset):
    """
    HuggingFace SST-2 wrapper.

    Important: Longformer requires seq_len to be a multiple of
    2 * attention_window. With attention_window=256, multiples of 512.
    We pad to MAX_LENGTH=512 which satisfies this constraint.
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
            "labels":         torch.tensor(self.data[idx]["label"],
                                           dtype=torch.long),
        }


# ══════════════════════════════════════════════════════════════════════════════
# PART F: Training and evaluation loops
# ══════════════════════════════════════════════════════════════════════════════

def train_epoch(model, loader, optimizer, scheduler, scaler, device):
    model.train()
    total_loss, total_correct, total_examples = 0.0, 0, 0

    for batch in loader:
        input_ids      = batch["input_ids"].to(device)
        attention_mask = batch["attention_mask"].to(device)
        labels         = batch["labels"].to(device)

        # CLS token gets global attention (index 0)
        global_attention_mask = torch.zeros_like(input_ids)
        global_attention_mask[:, 0] = 1

        optimizer.zero_grad()

        with autocast(device_type="cuda", dtype=torch.bfloat16):
            outputs = model(
                input_ids=input_ids,
                attention_mask=attention_mask,
                global_attention_mask=global_attention_mask,
                labels=labels,
            )
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
def evaluate(model, loader, device, split_name: str = "Val"):
    model.eval()
    loss_fn = nn.CrossEntropyLoss()
    total_loss, total_correct, total_examples = 0.0, 0, 0

    for batch in loader:
        input_ids      = batch["input_ids"].to(device)
        attention_mask = batch["attention_mask"].to(device)
        labels         = batch["labels"].to(device)

        global_attention_mask = torch.zeros_like(input_ids)
        global_attention_mask[:, 0] = 1

        outputs = model(
            input_ids=input_ids,
            attention_mask=attention_mask,
            global_attention_mask=global_attention_mask,
        )
        logits = outputs.logits

        total_loss     += loss_fn(logits, labels).item()
        preds           = torch.argmax(logits, dim=1)
        total_correct  += (preds == labels).sum().item()
        total_examples += labels.size(0)

    avg_loss = total_loss / len(loader)
    accuracy = total_correct / total_examples
    print(f"  {split_name} → Loss: {avg_loss:.4f}, Accuracy: {accuracy:.4f}")
    return avg_loss, accuracy


# ══════════════════════════════════════════════════════════════════════════════
# PART G: Main
# ══════════════════════════════════════════════════════════════════════════════

def main():
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    print(f"Using device: {device}")

    # ── Tokenizer ─────────────────────────────────────────────────────────────
    # allenai/longformer-base-4096 tokenizer — uses RoBERTa's BPE vocab.
    # We only use the tokenizer here; model weights are NOT loaded (from scratch).
    tokenizer = LongformerTokenizer.from_pretrained("allenai/longformer-base-4096")

    # ── Dataset ───────────────────────────────────────────────────────────────
    print("Loading SST-2 …")
    data       = load_dataset("stanfordnlp/sst2")
    train_data = SST2Dataset(data["train"],      tokenizer)
    val_data   = SST2Dataset(data["validation"], tokenizer)

    train_loader = DataLoader(train_data, batch_size=8,  shuffle=True,
                              collate_fn=default_data_collator, num_workers=2)
    val_loader   = DataLoader(val_data,   batch_size=16,
                              collate_fn=default_data_collator, num_workers=2)

    print(f"Train: {len(train_data):,}  |  Val: {len(val_data):,}")

    # ── Model config ──────────────────────────────────────────────────────────
    # attention_window: per-layer one-sided window size (list, one per layer).
    # With window=256 each token attends to 256 tokens on each side (512 total).
    # seq_len must be a multiple of 2*window = 512 — matches our MAX_LENGTH=512.
    config = LongformerConfig(
        vocab_size=tokenizer.vocab_size,
        hidden_size=768,
        num_hidden_layers=6,           # reduced from 12 to fit on one GPU
        num_attention_heads=12,
        intermediate_size=3072,
        hidden_act="gelu",
        hidden_dropout_prob=0.1,
        attention_probs_dropout_prob=0.1,
        max_position_embeddings=514,   # Longformer uses RoBERTa-style (+2 offset)
        type_vocab_size=1,
        attention_window=[256] * 6,    # one-sided window per layer
        num_labels=2,
        pad_token_id=tokenizer.pad_token_id,
    )

    model = L1LongformerForSequenceClassification(config)
    model.resize_token_embeddings(len(tokenizer))
    model = model.to(device)
    print(f"Model parameters: {sum(p.numel() for p in model.parameters()):,}")

    # ── Optimiser + scheduler ─────────────────────────────────────────────────
    NUM_EPOCHS   = 10
    PATIENCE     = 3
    WARMUP_STEPS = len(train_loader)           # 1 epoch warm-up
    TOTAL_STEPS  = NUM_EPOCHS * len(train_loader)

    optimizer = torch.optim.AdamW(
        model.parameters(),
        lr=1e-4,
        weight_decay=0.1,
        betas=(0.9, 0.95),
    )
    scheduler = get_linear_schedule_with_warmup(
        optimizer,
        num_warmup_steps=WARMUP_STEPS,
        num_training_steps=TOTAL_STEPS,
    )
    scaler = GradScaler()

    # ── Training loop with early stopping ─────────────────────────────────────
    best_val_acc      = 0.0
    epochs_no_improve = 0

    for epoch in range(1, NUM_EPOCHS + 1):
        train_loss, train_acc = train_epoch(
            model, train_loader, optimizer, scheduler, scaler, device)
        print(f"Epoch {epoch}/{NUM_EPOCHS}  "
              f"Train Loss: {train_loss:.4f}  Train Acc: {train_acc:.4f}")

        val_loss, val_acc = evaluate(model, val_loader, device, "Val")

        if val_acc > best_val_acc:
            best_val_acc = val_acc
            model.save_pretrained("./best_longformer_l1")
            tokenizer.save_pretrained("./best_longformer_l1")
            print(f"  ✓ New best val accuracy: {best_val_acc:.4f} — model saved.")
            epochs_no_improve = 0
        else:
            epochs_no_improve += 1
            print(f"  No improvement ({epochs_no_improve}/{PATIENCE})")
            if epochs_no_improve >= PATIENCE:
                print("Early stopping triggered.")
                break

    # ── Final evaluation with best checkpoint ─────────────────────────────────
    print("\nLoading best checkpoint …")
    best_model = L1LongformerForSequenceClassification.from_pretrained(
        "./best_longformer_l1")
    best_model.config.pad_token_id = tokenizer.pad_token_id
    best_model = best_model.to(device)
    evaluate(best_model, val_loader, device, "Best model (Val)")

    # ── Optional: 8-bit quantized evaluation ──────────────────────────────────
    try:
        quant_cfg = BitsAndBytesConfig(load_in_8bit=True)
        q_model   = L1LongformerForSequenceClassification.from_pretrained(
            "./best_longformer_l1",
            quantization_config=quant_cfg,
            device_map="auto",
        )
        print("Model loaded with 8-bit weights!")
        evaluate(q_model, val_loader,
                 next(q_model.parameters()).device, "8-bit quantized (Val)")
    except Exception as e:
        print(f"8-bit quantization skipped: {e}")


if __name__ == "__main__":
    main()