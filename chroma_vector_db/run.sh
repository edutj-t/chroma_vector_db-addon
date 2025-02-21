#!/usr/bin/with-contenv bash
set -e

# -----------------------------------------------------------------------------
# Chroma Vector DB add-on service script
#
# This script is executed automatically by s6-overlay (/init running as PID 1).
# It uses Bashio to retrieve configuration and log messages.
# Do NOT invoke any s6 commands here.
# -----------------------------------------------------------------------------

# Retrieve port configuration using Bashio
PORT=$(bashio::config 'port')

bashio::log.info "Starting the Chroma Vector DB add-on..."
bashio::log.info "Chroma is pre-installed. Launching on port: ${PORT}"

# Launch the chromadb server
exec python3 -m chromadb --port "${PORT}"

