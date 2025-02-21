#!/usr/bin/with-contenv bash
set -e

# -----------------------------------------------------------------------------
# Chroma Vector DB add-on service script
# This script is executed by s6-overlay (PID 1) automatically.
# Do NOT call any s6 commands (like s6-overlay-suexec) here.
# -----------------------------------------------------------------------------

# Retrieve add-on configuration using Bashio
CHROMA_VERSION=$(bashio::config 'chroma_version')
PORT=$(bashio::config 'port')

bashio::log.info "Starting the Chroma Vector DB add-on..."
bashio::log.info "Chroma version: ${CHROMA_VERSION}"
bashio::log.info "Listening on port: ${PORT}"

# Install chromadb from PyPI; if "latest" is chosen, install without version pinning.
if [ "${CHROMA_VERSION}" = "latest" ]; then
    bashio::log.info "Installing latest chromadb..."
    pip install --no-cache-dir chromadb
else
    bashio::log.info "Installing chromadb version ${CHROMA_VERSION}..."
    pip install --no-cache-dir "chromadb==${CHROMA_VERSION}"
fi

bashio::log.info "Launching chromadb server on port ${PORT}..."
exec python3 -m chromadb --port "${PORT}"
