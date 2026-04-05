@echo off
REM Start Tier 2 Llama Server on port 8002
REM Qwen2.5-1.5B-Instruct-Q4_K_M model with 4096 context

cd /d C:\llama

llama-server.exe ^
  --model "Qwen2.5-1.5B-Instruct-Q4_K_M.gguf" ^
  --port 8002 ^
  --ngl 99 ^
  --ctx-size 4096

pause
