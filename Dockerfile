# Use Python 3.11 instead of 3.9 as SWE-agent requires Python 3.11 or higher
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Install git and build dependencies
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Clone the SWE-agent repository
RUN git clone https://github.com/SWE-agent/SWE-agent.git /app

# Install dependencies including 'rich' and other commonly needed packages
RUN python -m pip install --upgrade pip && \
    pip install GitPython ghapi litellm pydantic-settings rich typer colorama pyyaml && \
    pip install --editable . && echo "Installation succeeded"

# Set the BUILD_VERSION argument with a default value
ARG BUILD_VERSION=1.0.0
ENV BUILD_VERSION=${BUILD_VERSION}

# Set the default command to run when the container starts using the installed entrypoint
CMD ["sweagent", "--help"]