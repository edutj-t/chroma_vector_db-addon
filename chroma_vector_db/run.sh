#!/usr/bin/with-contenv bash
# -----------------------------------------------------------------------------
# This script is automatically started by s6-overlay (PID 1) for the Chroma service.
# Do not manually call s6 or overlay commands here; just run your main process.
# -----------------------------------------------------------------------------

set -e  # Exit on error

# Pull in Bashio for logging and config (already in Home Assistant base images)
CHROMA_VERSION="$(bashio::config 'chroma_version')"
PORT="$(bashio::config 'port')"

bashio::log.info "Starting the Chroma Vector DB add-on..."
bashio::log.info "Configured version: ${CHROMA_VERSION}"
bashio::log.info "Configured port: ${PORT}"

# If you want to install a specific version of Chroma, handle "latest" vs. pinned:
if [ "${CHROMA_VERSION}" = "latest" ]; then
    bashio::log.info "Installing the latest Chroma from PyPI..."
    pip install --no-cache-dir chromadb
else
    bashio::log.info "Installing Chroma version ${CHROMA_VERSION} from PyPI..."
    pip install --no-cache-dir "chromadb==${CHROMA_VERSION}"
fi

bashio::log.info "Launching Chroma on port ${PORT}..."
exec python3 -m chromadb --port "${PORT}"
