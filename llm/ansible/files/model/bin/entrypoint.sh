#!/bin/bash

MODEL_CUSTOM="nl2sql-qwen"

echo "=========================================="
echo "  NL2SQL Security Lab — Ollama Container  "
echo "=========================================="

echo "[1/4] Starting Ollama server..."
ollama serve &
OLLAMA_PID=$!

echo "[2/4] Waiting for Ollama to be ready..."
MAX_WAIT=60
COUNT=0
while [ $COUNT -lt $MAX_WAIT ]; do
    if ollama list > /dev/null 2>&1; then
        echo "      ✓ Ollama ready after ${COUNT}s"
        break
    fi
    echo "      waiting... ${COUNT}s"
    sleep 2
    COUNT=$((COUNT + 2))
done

if [ $COUNT -ge $MAX_WAIT ]; then
    echo "      ❌ Timeout — Ollama did not start"
    exit 1
fi

echo "[3/4] Copying GGUF to Ollama model store..."
if [ ! -f "/root/.ollama/models/qwen-q4km.gguf" ]; then
    cp /models/qwen-q4km.gguf /root/.ollama/models/qwen-q4km.gguf
    echo "      ✓ Copied"
else
    echo "      ✓ Already exists — skipping"
fi

echo "[4/4] Loading model: $MODEL_CUSTOM"
if ollama list | grep -q "$MODEL_CUSTOM"; then
    echo "      ✓ Already loaded — skipping"
else
    ollama create "$MODEL_CUSTOM" -f /Modelfile
    echo "      ✓ $MODEL_CUSTOM created"
fi

echo "=========================================="
ollama list
echo "  Server running on :11434"
echo "=========================================="

wait $OLLAMA_PID