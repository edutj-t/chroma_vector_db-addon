#!/usr/bin/env bash
set -e

# Log startup message
bashio::log.info "Starting Chroma Vector DB add-on"

# Retrieve configuration options using bashio
PORT=$(bashio::config 'port')
CHROMA_VERSION=$(bashio::config 'chroma_version')

bashio::log.info "Using Chroma version: ${CHROMA_VERSION}"
bashio::log.info "Chroma will run on port: ${PORT}"

# Update or install chromadb to ensure it is up-to-date
if [ "${CHROMA_VERSION}" = "latest" ]; then
    bashio::log.info "Installing latest chromadb..."
    pip install --upgrade chromadb
else
    bashio::log.info "Installing chromadb version ${CHROMA_VERSION}..."
    pip install --upgrade chromadb=="${CHROMA_VERSION}"
fi

# Start Chroma Vector DB, binding to all interfaces
bashio::log.info "Starting Chroma..."
exec chromadb run --host 0.0.0.0 --port "${PORT}"
