ARG BUILD_FROM=ghcr.io/home-assistant/addon-base:debian-10
FROM ${BUILD_FROM}

ENV LANG C.UTF-8

# Update apt and install required packages
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    build-essential \
    libffi-dev \
    libssl-dev \
    cargo \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip (optional but recommended)
RUN python3 -m pip install --upgrade pip

# Pre-install chromadb from PyPI.
# With manylinux wheels available on Debian, this should now succeed.
RUN python3 -m pip install --no-cache-dir chromadb

# Create the s6 service directory for Chroma.
RUN mkdir -p /etc/services.d/chroma

# Copy run.sh into that service directory.
COPY run.sh /etc/services.d/chroma/run
RUN chmod +x /etc/services.d/chroma/run

# Document that port 8000 is used.
EXPOSE 8000

# Let the base image's /init run as PID 1.
ENTRYPOINT [ "/init" ]
CMD []
