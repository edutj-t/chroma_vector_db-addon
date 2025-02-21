ARG BUILD_FROM=ghcr.io/home-assistant/addon-base:alpine-3.18
FROM ${BUILD_FROM}

ENV LANG C.UTF-8

# Install Python, pip, and the build dependencies required for chromadb (which uses Rust)
RUN apk add --no-cache \
    python3 \
    py3-pip \
    build-base \
    rust \
    cargo \
    musl-dev \
    libffi-dev \
    openssl-dev

# Pre-install chromadb from PyPI
RUN python3 -m pip install --no-cache-dir chromadb

# Create the s6 service directory for Chroma
RUN mkdir -p /etc/services.d/chroma

# Copy run.sh into that service directory
COPY run.sh /etc/services.d/chroma/run
RUN chmod +x /etc/services.d/chroma/run

# Document that port 8000 is used (the actual binding is managed by Home Assistant)
EXPOSE 8000

# Use the base image's /init as PID 1 (s6-overlay)
ENTRYPOINT [ "/init" ]
CMD []
