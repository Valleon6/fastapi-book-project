FROM python:3.11-slim as builder

# Install nginx and supervisor
RUN apt-get update && apt-get install -y nginx supervisor

# Set working directory
WORKDIR /app

# Install necessary Python packages
COPY . .
RUN pip install -r requirements.txt

# Copy nginx config
COPY nginx.conf /etc/nginx/nginx.conf

# Copy supervisor config
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Expose necessary ports
EXPOSE 80 8080

# Start both nginx and uvicorn using supervisord
CMD ["/usr/bin/supervisord"]