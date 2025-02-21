# Use the Home Assistant add-on base image
ARG BUILD_FROM=ghcr.io/home-assistant/addon-base:latest
FROM ${BUILD_FROM}

# Set locale
ENV LANG C.UTF-8

# Install Python and pip if necessary
RUN apk add --no-cache python3 py3-pip

# Copy the run script into the container
COPY run.sh /
RUN chmod +x /run.sh

# Expose the default port (the actual binding is handled by Home Assistant)
EXPOSE 8000

# Run the add-on
ENTRYPOINT [ "/run.sh" ]
