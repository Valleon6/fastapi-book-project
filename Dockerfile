## Use an official image
#FROM python:3.11
#
## Install Nginx
#RUN apt update && apt install -y nginx
#
## Set the working directory
#WORKDIR /app
#
## Copy the FastAPI application
#COPY . .
#
## Install dependencies
#RUN pip install --no-cache-dir -r requirements.txt
#
## Copy Nginx config
#COPY nginx.conf /etc/nginx/nginx.conf
#
## Expose necessary ports
#EXPOSE 80 8080
#
## Start Nginx and the FastAPI app
#CMD service nginx start && uvicorn main:app --host 0.0.0.0 --port 8080

# Use an official image
FROM python:3.11

# Set working directory
WORKDIR /app

# Install required packages (Nginx and Supervisor)
RUN apt-get update && apt-get install -y nginx supervisor

# Copy application code
COPY . .

# Install Python dependencies
RUN pip install -r requirements.txt

# Copy Nginx and Supervisor configurations
COPY nginx.conf /etc/nginx/nginx.conf
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Allow Railway to assign the correct port
# Default to 80, but Railway will override it
ENV PORT=80

# Run Supervisor (which starts both Nginx and Uvicorn)
CMD ["/usr/bin/supervisord"]