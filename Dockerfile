# Use the Ubuntu 20.04 image
FROM ubuntu:20.04

# Set environment variables to avoid user interaction during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update and install required packages
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    git \
    && rm -rf /var/lib/apt/lists/*

# Clone the SFA3D repository
RUN git clone https://github.com/maudzung/SFA3D.git /SFA3D

# Change working directory
WORKDIR /SFA3D

# Install Python dependencies
RUN pip3 install -r requirements.txt

# Expose the port the app runs on (if applicable)
# EXPOSE 8080

# Command to run your app (to be adjusted after trying in drdo)
CMD ["python3", "main.py"]

