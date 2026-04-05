@echo off
REM Start Tier 3/4 Llama Server on port 8003
REM Main model: Qwen2.5-1.5B-Instruct-IQ2_XS
REM Draft model: Qwen2.5-0.5B-Instruct-Q2_K
REM Speculative decoding with 32 threads and 4096 context

cd /d C:\llama

llama-server.exe ^
  --model "Qwen2.5-1.5B-Instruct-IQ2_XS.gguf" ^
  --draft-model "Qwen2.5-0.5B-Instruct-Q2_K.gguf" ^
  --port 8003 ^
  --threads 32 ^
  --draft-max 8 ^
  --ctx-size 4096

pause
