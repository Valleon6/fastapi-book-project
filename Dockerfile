# Use a base image with Nginx
FROM nginx:alpine

# Copy your custom nginx.conf to the container
COPY nginx.conf /etc/nginx/nginx.conf

# Install dependencies for FastAPI
FROM python:3.11-slim as builder

# Set working directory
WORKDIR /app

# Copy your FastAPI application code into the container
COPY . .

# Install necessary Python packages
RUN pip install -r requirements.txt

# Expose the ports for Nginx and Uvicorn
EXPOSE 80 8080

# Start Nginx and Uvicorn together in the background
CMD ["sh", "-c", "service nginx start && uvicorn main:app --host 0.0.0.0 --port 8080"]