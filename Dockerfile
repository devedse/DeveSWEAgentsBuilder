# Base image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system utilities
RUN apt-get update && apt-get install -y git build-essential \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Clone SWE-agent code
RUN git clone https://github.com/SWE-agent/SWE-agent.git /app

# Install Python dependencies
RUN python -m pip install --upgrade pip && \
    pip install GitPython colorama ghapi litellm pydantic-settings pyyaml rich typer && \
    pip install --editable .

# Default build version
ARG BUILD_VERSION=1.0.0
ENV BUILD_VERSION=${BUILD_VERSION}

# Default command
CMD ["sweagent", "--help"]