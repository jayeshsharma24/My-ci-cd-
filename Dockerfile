# Use official Ubuntu as base image
FROM ubuntu:22.04

# Prevents interactive prompts during package installs
ENV DEBIAN_FRONTEND=noninteractive

# Install Apache2 and clean up cache
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy website or app files into the web server directory
# (Adjust the source path according to your project layout)
COPY ./index.html /var/www/html/

# Set permissions (optional but good practice)
RUN chown -R index.html /var/www/html

# Expose port 80
EXPOSE 80

# Start Apache in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]
