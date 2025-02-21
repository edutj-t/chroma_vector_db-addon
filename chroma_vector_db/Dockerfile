ARG BUILD_FROM=ghcr.io/home-assistant/addon-base:debian-11
FROM ${BUILD_FROM}

# Use bash instead of the default shell. Install bash if needed.
RUN apt-get update && apt-get install -y bash && rm -rf /var/lib/apt/lists/*

# Set SHELL to bash with pipefail enabled.
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENV LANG C.UTF-8

# Update package lists and install required packages.
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    build-essential \
    libffi-dev \
    libssl-dev \
    cargo \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip.
RUN python3 -m pip install --upgrade pip

# Pre-install a pinned version of chromadb (adjust the version if needed).
RUN python3 -m pip install --no-cache-dir chromadb==0.3.21

# Create the s6 service directory for Chroma.
RUN mkdir -p /etc/services.d/chroma

# Copy run.sh into that service directory.
COPY run.sh /etc/services.d/chroma/run
RUN chmod +x /etc/services.d/chroma/run

# Expose port 8000 (actual binding is managed by Home Assistant).
EXPOSE 8000

# Start s6-overlay (provided by the base image) as PID 1.
ENTRYPOINT [ "/init" ]
CMD []
