"""
EcoTransformer — L1 Longformer: IMDb Sentiment Classification
==============================================================

Trains an L1-Longformer on the IMDb dataset (25k train / 25k test, binary
sentiment). IMDb reviews are typically much longer than SST-2 sentences,
making Longformer's efficient sliding-window attention a natural fit.

DATASET
-------
  IMDb (imdb on HuggingFace):
    - Train : 25,000 reviews  (balanced: 12,500 pos / 12,500 neg)
    - Test  : 25,000 reviews  (held-out; used as validation here)
    - Labels: 0 = negative, 1 = positive
  Average review length ~230 tokens (tokenized), max often >512.
  Padding/truncation to MAX_LENGTH=512 keeps Longformer's window constraint.

L1 ATTENTION
------------
  Every attention score is computed as:
      score = -λ · Σ|Q_i - K_j|   (L1 pairwise distance)
  replacing the standard dot-product Q·Kᵀ.
  λ = 0.1  (negated so softmax peaks at similar Q/K pairs).
  Applied to the sliding-window path only; global path uses same override
  since both route through _sliding_chunks_query_key_matmul.

LONGFORMER SPECIFICS
--------------------
  - global_attention_mask: [CLS] token (pos 0) = 1, rest = 0
  - seq_len must be a multiple of 2 × attention_window (512 here)
  - Tokenizer: LongformerTokenizer (RoBERTa BPE, 50265 vocab)

ARCHITECTURE
------------
  Base config  : allenai/longformer-base-4096
  Hidden size  : 768
  Layers       : 12 (full base)
  Heads        : 12
  Attention window: 512 tokens (sliding)
  Classifier   : LayerNorm → Linear(768,256) → GELU → Dropout(0.3) → Linear(256,2)

ANTI-OVERFITTING
  - AdamW lr=2e-5, weight_decay=0.01
  - Linear warm-up (1 epoch) + cosine LR decay
  - Gradient clipping max_norm=1.0
  - Early stopping patience=3, best checkpoint saved to ./best_longformer_l1_imdb

Usage:
    python longformer_l1_imdb.py
    python longformer_l1_imdb.py --epochs 5 --batch_size 4
    python longformer_l1_imdb.py --model_path allenai/longformer-base-4096

Requirements:
    pip install transformers datasets torch
"""

import os
import math
import argparse

import torch
import torch.nn as nn
from torch.utils.data import DataLoader, Dataset
from torch.amp import GradScaler, autocast

from datasets import load_dataset
from transformers import (
    LongformerConfig,
    LongformerTokenizer,
    default_data_collator,
    get_cosine_schedule_with_warmup,
)
from transformers.models.longformer.modeling_longformer import (
    LongformerSelfAttention,
    LongformerAttention,
    LongformerLayer,
    LongformerEncoder,
    LongformerModel,
    LongformerPreTrainedModel,
)
from transformers.utils import logging as hf_logging

hf_logging.set_verbosity_error()

# ── Constants ─────────────────────────────────────────────────────────────────
MAX_LENGTH = 512   # multiple of 2×attention_window; covers most IMDb reviews
L1_LAMBDA  = -0.1


# ══════════════════════════════════════════════════════════════════════════════
# L1 Attention
# ══════════════════════════════════════════════════════════════════════════════

def chunked_l1_scores(query_chunks: torch.Tensor,
                      key_chunks:   torch.Tensor) -> torch.Tensor:
    """
    Pairwise L1 distance between every (query, key) chunk pair.
    Replaces torch.einsum("bcxd,bcyd->bcxy", Q, K) in Longformer.

    Shapes:
        query_chunks / key_chunks : (batch*heads, chunks, 2w, head_dim)
        output                    : (batch*heads, chunks, 2w, 2w)
    """
    diff = query_chunks.unsqueeze(3) - key_chunks.unsqueeze(2)
    return diff.abs().sum(dim=-1) * L1_LAMBDA


class L1LongformerSelfAttention(LongformerSelfAttention):
    """Longformer self-attention with L1 distance for the local (window) path."""

    def _sliding_chunks_query_key_matmul(self,
                                          query: torch.Tensor,
                                          key:   torch.Tensor,
                                          window_overlap: int) -> torch.Tensor:
        batch_size, seq_len, num_heads, head_dim = query.size()
        assert seq_len % (window_overlap * 2) == 0
        assert query.size() == key.size()

        chunks_count = torch.div(seq_len, window_overlap, rounding_mode="trunc") - 1

        query = query.transpose(1, 2).reshape(batch_size * num_heads, seq_len, head_dim)
        key   = key.transpose(1, 2).reshape(batch_size * num_heads, seq_len, head_dim)

        onnx_export = getattr(self.config, "onnx_export", False)
        query = self._chunk(query, window_overlap, onnx_export)
        key   = self._chunk(key,   window_overlap, onnx_export)

        diagonal_chunked_scores = chunked_l1_scores(query, key)

        diagonal_chunked_scores = self._pad_and_transpose_last_two_dims(
            diagonal_chunked_scores, padding=(0, 0, 0, 1)
        )

        diagonal_attention_scores = diagonal_chunked_scores.new_zeros(
            (batch_size * num_heads, chunks_count + 1,
             window_overlap, window_overlap * 2 + 1)
        )

        diagonal_attention_scores[:, :-1, :, window_overlap:] = (
            diagonal_chunked_scores[:, :, :window_overlap, :window_overlap + 1]
        )
        diagonal_attention_scores[:, -1, :, window_overlap:] = (
            diagonal_chunked_scores[:, -1, window_overlap:, :window_overlap + 1]
        )
        diagonal_attention_scores[:, 1:, :, :window_overlap] = (
            diagonal_chunked_scores[:, :, -(window_overlap + 1):-1, window_overlap + 1:]
        )
        diagonal_attention_scores[:, 0, 1:window_overlap, 1:window_overlap] = (
            diagonal_chunked_scores[:, 0, :window_overlap - 1, 1 - window_overlap:]
        )

        diagonal_attention_scores = diagonal_attention_scores.view(
            batch_size, num_heads, seq_len, 2 * window_overlap + 1
        ).transpose(2, 1)

        self._mask_invalid_locations(diagonal_attention_scores, window_overlap)
        return diagonal_attention_scores


class L1LongformerAttention(LongformerAttention):
    def __init__(self, config, layer_id: int = 0):
        super().__init__(config, layer_id=layer_id)
        self.self = L1LongformerSelfAttention(config, layer_id=layer_id)


class L1LongformerLayer(LongformerLayer):
    def __init__(self, config, layer_id: int = 0):
        super().__init__(config, layer_id=layer_id)
        self.attention = L1LongformerAttention(config, layer_id=layer_id)


class L1LongformerEncoder(LongformerEncoder):
    def __init__(self, config):
        super().__init__(config)
        self.layer = nn.ModuleList(
            [L1LongformerLayer(config, layer_id=i)
             for i in range(config.num_hidden_layers)]
        )


class L1LongformerModel(LongformerModel):
    def __init__(self, config, add_pooling_layer: bool = True):
        super().__init__(config, add_pooling_layer=add_pooling_layer)
        self.encoder = L1LongformerEncoder(config)
        self.post_init()


class L1LongformerForSequenceClassification(LongformerPreTrainedModel):
    """L1-Longformer for binary sentiment classification."""

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
                input_ids,
                attention_mask        = None,
                global_attention_mask = None,
                token_type_ids        = None,
                position_ids          = None,
                inputs_embeds         = None,
                labels                = None,
                output_attentions     = None,
                output_hidden_states  = None,
                return_dict           = None):

        if global_attention_mask is None:
            global_attention_mask = torch.zeros_like(input_ids)
            global_attention_mask[:, 0] = 1     # [CLS] gets global attention

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

        cls_hidden = outputs[0][:, 0, :]
        logits     = self.classifier(cls_hidden)

        loss = None
        if labels is not None:
            loss = nn.CrossEntropyLoss()(logits, labels)

        from types import SimpleNamespace
        return SimpleNamespace(loss=loss, logits=logits)


# ══════════════════════════════════════════════════════════════════════════════
# Dataset
# ══════════════════════════════════════════════════════════════════════════════

class IMDbDataset(Dataset):
    """
    IMDb wrapper for Longformer.
    Reviews are long — truncation at 512 retains most of the signal.
    seq_len=512 satisfies the 2×attention_window=512 constraint.
    """

    def __init__(self, hf_split, tokenizer, max_length: int = MAX_LENGTH):
        self.data       = hf_split
        self.tokenizer  = tokenizer
        self.max_length = max_length

    def __len__(self):
        return len(self.data)

    def __getitem__(self, idx):
        enc = self.tokenizer(
            self.data[idx]["text"],
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
# Training and evaluation loops
# ══════════════════════════════════════════════════════════════════════════════

def train_epoch(model, loader, optimizer, scheduler, scaler, device):
    model.train()
    total_loss = total_correct = total_examples = 0

    for step, batch in enumerate(loader, 1):
        input_ids      = batch["input_ids"].to(device)
        attention_mask = batch["attention_mask"].to(device)
        labels         = batch["labels"].to(device)

        # [CLS] global attention
        global_attention_mask = torch.zeros_like(input_ids)
        global_attention_mask[:, 0] = 1

        optimizer.zero_grad()

        with autocast(device_type="cuda", dtype=torch.bfloat16):
            outputs = model(input_ids=input_ids,
                            attention_mask=attention_mask,
                            global_attention_mask=global_attention_mask,
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

        if step % 100 == 0:
            running_acc = total_correct / total_examples
            print(f"    step {step}/{len(loader)}  "
                  f"loss={total_loss/step:.4f}  acc={running_acc:.4f}")

    return total_loss / len(loader), total_correct / total_examples


@torch.no_grad()
def evaluate(model, loader, device, split_name: str = "Val"):
    model.eval()
    loss_fn = nn.CrossEntropyLoss()
    total_loss = total_correct = total_examples = 0

    for batch in loader:
        input_ids      = batch["input_ids"].to(device)
        attention_mask = batch["attention_mask"].to(device)
        labels         = batch["labels"].to(device)

        global_attention_mask = torch.zeros_like(input_ids)
        global_attention_mask[:, 0] = 1

        outputs = model(input_ids=input_ids,
                        attention_mask=attention_mask,
                        global_attention_mask=global_attention_mask)
        logits  = outputs.logits

        total_loss     += loss_fn(logits, labels).item()
        preds           = torch.argmax(logits, dim=1)
        total_correct  += (preds == labels).sum().item()
        total_examples += labels.size(0)

    avg_loss = total_loss / len(loader)
    accuracy = total_correct / total_examples
    print(f"  {split_name} → Loss: {avg_loss:.4f}  Accuracy: {accuracy:.4f}")
    return avg_loss, accuracy


# ══════════════════════════════════════════════════════════════════════════════
# Main
# ══════════════════════════════════════════════════════════════════════════════

def parse_args():
    p = argparse.ArgumentParser(
        description="Train L1-Longformer on IMDb sentiment classification")
    p.add_argument("--model_path", default="allenai/longformer-base-4096",
                   help="HF hub ID or local path for base weights "
                        "(default: allenai/longformer-base-4096)")
    p.add_argument("--save_path", default="./best_longformer_l1_imdb",
                   help="Directory to save best checkpoint (default: ./best_longformer_l1_imdb)")
    p.add_argument("--batch_size", type=int, default=4,
                   help="Training batch size (default: 4; IMDb seqs are 512 tokens)")
    p.add_argument("--eval_batch_size", type=int, default=8,
                   help="Eval batch size (default: 8)")
    p.add_argument("--epochs", type=int, default=10,
                   help="Max training epochs (default: 10)")
    p.add_argument("--lr", type=float, default=2e-5,
                   help="Peak learning rate (default: 2e-5)")
    p.add_argument("--weight_decay", type=float, default=0.01,
                   help="AdamW weight decay (default: 0.01)")
    p.add_argument("--patience", type=int, default=3,
                   help="Early stopping patience in epochs (default: 3)")
    p.add_argument("--max_length", type=int, default=512,
                   help="Max token length — must be multiple of 2×attention_window "
                        "(default: 512)")
    p.add_argument("--scratch", action="store_true",
                   help="Train from scratch instead of loading pretrained weights")
    return p.parse_args()


def main():
    args   = parse_args()
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    print(f"Using device : {device}")
    print(f"Base model   : {args.model_path}")
    print(f"Save path    : {args.save_path}")
    print(f"Max length   : {args.max_length}")
    print(f"Batch size   : {args.batch_size} (train)  {args.eval_batch_size} (eval)")

    # ── Tokenizer ─────────────────────────────────────────────────────────────
    tokenizer = LongformerTokenizer.from_pretrained(args.model_path)

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

    # ── Model ─────────────────────────────────────────────────────────────────
    if args.scratch:
        print("\nBuilding model from scratch …")
        config = LongformerConfig(
            vocab_size=tokenizer.vocab_size,
            hidden_size=768,
            num_hidden_layers=12,
            num_attention_heads=12,
            intermediate_size=3072,
            hidden_act="gelu",
            hidden_dropout_prob=0.1,
            attention_probs_dropout_prob=0.1,
            max_position_embeddings=4098,
            type_vocab_size=1,
            attention_window=[256] * 12,
            num_labels=2,
            pad_token_id=tokenizer.pad_token_id,
        )
        model = L1LongformerForSequenceClassification(config)
    else:
        print("\nLoading pretrained Longformer weights …")
        base_config = LongformerConfig.from_pretrained(args.model_path)
        base_config.num_labels = 2
        model = L1LongformerForSequenceClassification.from_pretrained(
            args.model_path, config=base_config, ignore_mismatched_sizes=True)

    model = model.to(device)
    n_params = sum(p.numel() for p in model.parameters())
    print(f"Model parameters: {n_params:,}")

    # ── Optimiser + scheduler ─────────────────────────────────────────────────
    NUM_EPOCHS   = args.epochs
    WARMUP_STEPS = len(train_loader)          # 1 epoch warm-up
    TOTAL_STEPS  = NUM_EPOCHS * len(train_loader)

    # Separate LR for classifier head vs backbone
    backbone_params   = [p for n, p in model.named_parameters()
                         if "classifier" not in n]
    classifier_params = [p for n, p in model.named_parameters()
                         if "classifier" in n]

    optimizer = torch.optim.AdamW([
        {"params": backbone_params,   "lr": args.lr,      "weight_decay": args.weight_decay},
        {"params": classifier_params, "lr": args.lr * 10, "weight_decay": 0.0},
    ], betas=(0.9, 0.999), eps=1e-8)

    scheduler = get_cosine_schedule_with_warmup(
        optimizer,
        num_warmup_steps=WARMUP_STEPS,
        num_training_steps=TOTAL_STEPS,
    )
    scaler = GradScaler()

    # ── Training loop ─────────────────────────────────────────────────────────
    best_val_acc      = 0.0
    epochs_no_improve = 0
    os.makedirs(args.save_path, exist_ok=True)

    for epoch in range(1, NUM_EPOCHS + 1):
        print(f"\n{'='*60}")
        print(f"Epoch {epoch}/{NUM_EPOCHS}")
        print(f"{'='*60}")

        train_loss, train_acc = train_epoch(
            model, train_loader, optimizer, scheduler, scaler, device)
        print(f"  Train → Loss: {train_loss:.4f}  Accuracy: {train_acc:.4f}")

        val_loss, val_acc = evaluate(model, val_loader, device)

        if val_acc > best_val_acc:
            best_val_acc = val_acc
            model.save_pretrained(args.save_path)
            tokenizer.save_pretrained(args.save_path)
            print(f"  ✓ New best val acc: {best_val_acc:.4f} — checkpoint saved.")
            epochs_no_improve = 0
        else:
            epochs_no_improve += 1
            print(f"  No improvement ({epochs_no_improve}/{args.patience})")
            if epochs_no_improve >= args.patience:
                print("Early stopping triggered.")
                break

    # ── Final eval with best checkpoint ───────────────────────────────────────
    print(f"\n{'='*60}")
    print("Loading best checkpoint for final evaluation …")
    best = L1LongformerForSequenceClassification.from_pretrained(args.save_path)
    best = best.to(device)
    evaluate(best, val_loader, device, "Best model (Test)")
    print(f"\nBest checkpoint saved to: {args.save_path}")


if __name__ == "__main__":
    main()