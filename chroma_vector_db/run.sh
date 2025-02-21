#!/usr/bin/with-contenv bash
# -----------------------------------------------------------------------------
# Home Assistant add-on service script for Chroma Vector DB
#
# This script is run by s6-overlay (PID 1) automatically when the container
# starts. Do not manually invoke s6 commands here, as that can cause
# "can only run as pid 1" errors.
# -----------------------------------------------------------------------------

# If your add-on uses Bashio for logging or config retrieval:
#   https://github.com/hassio-addons/bashio
# it's already installed in the official Home Assistant add-on base images.
# We just need the following shebang line to enable it:
# #!/usr/bin/with-contenv bash

# Retrieve configuration options from config.json
CHROMA_VERSION="$(bashio::config 'chroma_version')"  # e.g. 'latest'
PORT="$(bashio::config 'port')"                      # e.g. 8000

# Log some info to the add-on logs
bashio::log.info "Starting the Chroma Vector DB add-on..."
bashio::log.info "Using Chroma version: ${CHROMA_VERSION}"
bashio::log.info "Listening on port: ${PORT}"

# If you need to install or update Chroma from PyPI at runtime, you could do:
# pip install --no-cache-dir "chromadb==${CHROMA_VERSION}"
# or pip install --no-cache-dir "chromadb" if using 'latest'

# Now run Chroma. Adjust the command to whatever works for your environment.
# Example:
exec python3 -m chromadb --port "${PORT}"
