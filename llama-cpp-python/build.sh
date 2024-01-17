#!/bin/sh

MODEL_URL="https://huggingface.co/SlyEcho/open_llama_3b_gguf/blob/main/open-llama-3b-q5_1.gguf"
FILE_PATH="./open-llama-3b-q5_1.gguf"
SYMLINK_PATH="./model.gguf"
IMAGE_NAME="open_llama_3b"

# Download the model if it doesn't exist
if [ ! -f "$FILE_PATH" ]; then
    curl -L -o "$FILE_PATH" "$MODEL_URL"
fi
# Refresh the symlink
ln -s "$FILE_PATH" "$SYMLINK_PATH"

# Build the default OpenBLAS image
docker build -t $IMAGE_NAME .

# List the docker images
docker images | egrep "^(REPOSITORY|$IMAGE_NAME)"

echo
echo "To start the docker container run:"
echo "docker run -t -p 8000:8000 $IMAGE_NAME"