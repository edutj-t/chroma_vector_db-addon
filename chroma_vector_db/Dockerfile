ARG BUILD_FROM=ghcr.io/home-assistant/addon-base:latest
FROM ${BUILD_FROM}

ENV LANG C.UTF-8

# Install Python 3 and pip if needed
RUN apk add --no-cache python3 py3-pip

# Create the s6 service directory for Chroma
RUN mkdir -p /etc/services.d/chroma

# Copy run.sh into that service directory
COPY run.sh /etc/services.d/chroma/run
RUN chmod +x /etc/services.d/chroma/run

# (Optional) Document that port 8000 is used
EXPOSE 8000

# Ensure s6-overlay (already in addon-base) runs as PID 1
ENTRYPOINT [ "/init" ]
CMD []
