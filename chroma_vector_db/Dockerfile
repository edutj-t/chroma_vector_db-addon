ARG BUILD_FROM=ghcr.io/home-assistant/addon-base:latest
FROM ${BUILD_FROM}

# Set locale
ENV LANG C.UTF-8

# Install Python and pip if necessary
RUN apk add --no-cache python3 py3-pip

# Create the service folder
RUN mkdir -p /etc/services.d/chroma

# Copy your "run.sh" to the s6 service's run file
COPY run.sh /etc/services.d/chroma/run
RUN chmod +x /etc/services.d/chroma/run

# Expose the default port (the actual binding is handled by Home Assistant)
EXPOSE 8000

# Run the add-on
ENTRYPOINT [ "/init" ]
CMD []
