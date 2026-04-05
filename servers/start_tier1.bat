@echo off
REM Start Tier 1 Llama Server on port 8001
REM DeepSeek-R1-Distill-Qwen-32B-Q4_K_M model with 2048 context

cd /d C:\llama

llama-server.exe ^
  --model "DeepSeek-R1-Distill-Qwen-32B-Q4_K_M.gguf" ^
  --port 8001 ^
  --threads 16 ^
  --ctx-size 2048 ^
  --numa distribute

pause
