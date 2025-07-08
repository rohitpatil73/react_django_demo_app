# Use a lightweight official Python image
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y gcc --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Copy project files
COPY . /app

# Install Python dependencies
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Clean up build tools
RUN apt-get purge -y --auto-remove gcc

# Expose port
EXPOSE 8001

# Run Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8001"]
