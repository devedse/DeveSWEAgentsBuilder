# Use the official Python image as a base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app

# Upgrade pip and install dependencies
RUN python -m pip install --upgrade pip \
    && pip install --editable .

# Set the default command to run when the container starts
CMD ["sweagent", "--help"]