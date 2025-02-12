# Use a base image with Python and FastAPI pre-installed
FROM python:3.11-slim

# Set the working directory
WORKDIR /app

# Copy your FastAPI app files into the container
COPY . /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the FastAPI app port
EXPOSE 8000

# Command to run the FastAPI app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]