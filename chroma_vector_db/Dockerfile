ARG BUILD_FROM=ghcr.io/home-assistant/addon-base:latest
FROM ${BUILD_FROM}

ENV LANG C.UTF-8

# Install Python 3, pip, and additional build dependencies needed to compile chromadb
RUN apk add --no-cache python3 py3-pip build-base cargo

# Pre-install chromadb from PyPI using the existing pip version
RUN python3 -m pip install --no-cache-dir chromadb

# Create the s6 service directory for Chroma
RUN mkdir -p /etc/services.d/chroma

# Copy run.sh into that service directory
COPY run.sh /etc/services.d/chroma/run
RUN chmod +x /etc/services.d/chroma/run

# (Optional) Document that port 8000 is used
EXPOSE 8000

# Use s6-overlay (already in addon-base) as PID 1
ENTRYPOINT [ "/init" ]
CMD []
