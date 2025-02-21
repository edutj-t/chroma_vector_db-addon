#!/usr/bin/env bash
set -e

bashio::log.info "Starting Chroma Vector DB add-on"

PORT=$(bashio::config 'port')
CHROMA_VERSION=$(bashio::config 'chroma_version')

bashio::log.info "Using Chroma version: ${CHROMA_VERSION}"
bashio::log.info "Chroma will run on port: ${PORT}"

# Install ChromaDB
if [ "${CHROMA_VERSION}" = "latest" ]; then
    pip install --no-cache-dir --upgrade chromadb
else
    pip install --no-cache-dir --upgrade chromadb=="${CHROMA_VERSION}"
fi
export S6_BEHAVIOUR_IF_STAGE2_FAILS=2
# Start ChromaDB properly as PID 1
echo "Starting Chroma Vector DB add-on..."
exec chromadb run --host 0.0.0.0 --port "${PORT}"
