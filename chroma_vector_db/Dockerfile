ARG BUILD_FROM=ghcr.io/home-assistant/addon-base:latest
FROM ${BUILD_FROM}

ENV LANG C.UTF-8

# Install Python and pip, if needed
RUN apk add --no-cache python3 py3-pip

# Create the service folder
RUN mkdir -p /etc/services.d/chroma

# Copy your run script
COPY run.sh /etc/services.d/chroma/run
RUN chmod +x /etc/services.d/chroma/run

# (Optional) Document that port 8000 is exposed
EXPOSE 8000

# Use s6 as PID 1
ENTRYPOINT [ "/init" ]
CMD []
