#!/usr/bin/with-contenv bash
set -e

# -----------------------------------------------------------------------------
# Chroma Vector DB add-on service script
#
# This script is automatically executed by s6-overlay (PID 1)
# and uses Bashio to retrieve configuration options and log messages.
# -----------------------------------------------------------------------------

# Retrieve the configured port using Bashio.
PORT=$(bashio::config 'port')

bashio::log.info "Starting the Chroma Vector DB add-on..."
bashio::log.info "Launching chromadb on port: ${PORT}"

# Launch the chromadb server.
exec python3 -m chromadb --port "${PORT}"
