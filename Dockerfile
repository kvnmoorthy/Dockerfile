# Use a base image
FROM ubuntu:latest

# Install Nginx
RUN apt-get update && apt-get install -y nginx

# Copy your custom Nginx configuration
COPY ./ ./path

# Expose port 80
EXPOSE 80

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
