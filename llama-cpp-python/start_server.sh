#!/bin/sh

# For mlock support
ulimit -l unlimited
ls -la
if [ "$IMAGE" = "python:3-slim-bullseye" ]; then
    python3 -B -m llama_cpp.server --model /app/model.gguf
else
    # You may have to reduce --n_gpu_layers=1000 to 20 or less if you don't have enough VRAM
    python3 -B -m llama_cpp.server --model /app/model.gguf --n_gpu_layers=1000
fi
