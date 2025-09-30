# Use the official Node.js 20 image as a base
FROM node:20

# Install necessary dependencies for Wetty and node-gyp
RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    sudo

# Install Wetty globally
RUN npm install -g wetty

# Create a new user 'noejunior299' and set a password
RUN useradd -m -s /bin/bash noejunior299
RUN echo 'noejunior299:123456789' | chpasswd
RUN usermod -aG sudo noejunior299

# Expose the port the web service will run on
EXPOSE 3000

# Copy the startup script into the container
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Set the command to run on container startup
CMD ["/start.sh"]