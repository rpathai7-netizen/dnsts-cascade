# DNSTS Cascade — 4-Tier Async LLM System

## Hardware

- Dual Intel Xeon E5-2687W v0 (32 threads, AVX1 only)
- 88 GB DDR3 ECC RAM
- Nvidia Quadro K4200 (4 GB GDDR5, Compute 3.0)

## Architecture

| Tier | Role       | Model                  | Location   | Speed            |
| ---- | ---------- | ---------------------- | ---------- | ---------------- |
| 1    | Commander  | DeepSeek-R1-32B Q4_K_M | DDR3 RAM   | ~1.5 TPS         |
| 2    | GPU Worker | Qwen2.5-1.5B Q4_K_M    | K4200 VRAM | ~60 TPS          |
| 3    | CPU Target | Qwen2.5-1.5B IQ2_XS    | DDR3 RAM   | ~50 TPS combined |
| 4    | Drafter    | Qwen2.5-0.5B Q2_K      | DDR3 RAM   | (paired with T3) |

## Setup

1. Extract llama.cpp b2397 to C:\llama\
2. Place all GGUF models in C:\llama\models\
3. Run servers\start_tier1.bat, start_tier2.bat, start_tier3_4.bat
4. Run python orchestrator\main.py

## Target throughput

110–120 tokens/sec aggregate (Tier 2 + Tier 3+4 in parallel)
