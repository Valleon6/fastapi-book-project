# Use an official image
FROM python:3.11

# Install Nginx
RUN apt update && apt install -y nginx

# Set the working directory
WORKDIR /app

# Copy the FastAPI application
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy Nginx config
COPY nginx.conf /etc/nginx/nginx.conf

# Expose necessary ports
EXPOSE 80 8080

# Start Nginx and the FastAPI app
CMD service nginx start && uvicorn main:app --host 0.0.0.0 --port 8080