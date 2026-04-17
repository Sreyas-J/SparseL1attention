"""
EcoTransformer — L1 Longformer: Multi-Precision Evaluation Script
==================================================================
Loads a saved L1-Longformer model (from longformer_l1_sst2.py) and
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

Longformer-specific details handled here:
  - global_attention_mask built for every batch ([CLS] = 1, rest = 0)
  - seq_len must be a multiple of 2 × attention_window (512 here)
  - Tokenizer is LongformerTokenizer (RoBERTa BPE vocab)

Usage:
    python eval_longformer_precisions.py
    python eval_longformer_precisions.py --model_path ./best_longformer_l1
    python eval_longformer_precisions.py --batch_size 16 --skip_int8

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
    LongformerConfig,
    LongformerTokenizer,
    BitsAndBytesConfig,
    default_data_collator,
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
from datasets import load_dataset

hf_logging.set_verbosity_error()

# ── Must match training constants exactly ─────────────────────────────────────
MAX_LENGTH  = 512
L1_LAMBDA   = -0.1


# ══════════════════════════════════════════════════════════════════════════════
# Model definition — identical to longformer_l1_sst2.py
# Must be present so from_pretrained can reconstruct the custom architecture.
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
    """L1-Longformer classification head — identical to training script."""

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
            global_attention_mask[:, 0] = 1          # [CLS] gets global attention

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

class SST2Dataset(Dataset):
    """
    SST-2 wrapper for Longformer.
    seq_len is padded to MAX_LENGTH=512 which is a multiple of 2×window=512.
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

        # [CLS] token at position 0 gets global attention
        global_attention_mask = torch.zeros_like(input_ids)
        global_attention_mask[:, 0] = 1

        sync()
        t0 = time.perf_counter()

        if cast_dtype is not None:
            with torch.autocast(device_type="cuda", dtype=cast_dtype):
                outputs = model(
                    input_ids=input_ids,
                    attention_mask=attention_mask,
                    global_attention_mask=global_attention_mask,
                )
        else:
            outputs = model(
                input_ids=input_ids,
                attention_mask=attention_mask,
                global_attention_mask=global_attention_mask,
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

    valid   = len(loader) - nan_batches - inf_batches
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
    print(f"{'PRECISION COMPARISON — L1-Longformer on SST-2 Validation':^{W}}")
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

    best    = max(results, key=lambda x: x["accuracy"])
    fastest = min(results, key=lambda x: x["latency_ms"])
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
        description="Multi-precision eval for L1-Longformer on SST-2")
    p.add_argument("--model_path", default="./best_longformer_l1",
                   help="Path to saved model dir (default: ./best_longformer_l1)")
    p.add_argument("--batch_size", type=int, default=8,
                   help="Eval batch size (default: 8; Longformer uses more memory "
                        "than GPT-2 due to 512-token sequences)")
    p.add_argument("--max_length", type=int, default=512,
                   help="Token length — must match training and be a multiple of "
                        "2×attention_window (default: 512)")
    p.add_argument("--skip_int8", action="store_true",
                   help="Skip INT8 eval (if bitsandbytes is not installed)")
    p.add_argument("--skip_fp16", action="store_true",
                   help="Skip FP16 eval (useful if GPU doesn't support it well)")
    return p.parse_args()


def load_model(model_path: str, torch_dtype=None,
               quantization_config=None) -> L1LongformerForSequenceClassification:
    """Load the custom L1-Longformer from a saved directory."""
    kwargs = {}
    if torch_dtype is not None:
        kwargs["torch_dtype"] = torch_dtype
    if quantization_config is not None:
        kwargs["quantization_config"] = quantization_config
        kwargs["device_map"] = "auto"
    return L1LongformerForSequenceClassification.from_pretrained(
        model_path, **kwargs)


def main():
    args   = parse_args()
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    print(f"Using device : {device}")
    print(f"Model path   : {args.model_path}")
    print(f"Batch size   : {args.batch_size}")
    print(f"Max length   : {args.max_length}")

    # ── Tokenizer ─────────────────────────────────────────────────────────────
    tokenizer = LongformerTokenizer.from_pretrained(args.model_path)

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
            print("     FP16 max value (~65504) can be exceeded by L1 distance sums")
            print("     over 512 tokens × 64 head_dim.  Use BF16 instead.")
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