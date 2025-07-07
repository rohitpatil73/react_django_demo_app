# Use a lightweight official Python image
FROM python:3.9-slim

# Set environment variables to avoid Python buffering issues
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set working directory
WORKDIR /app

# Copy project files into container
COPY . /app

# Install system dependencies and Python packages
RUN apt-get update && apt-get install -y gcc && \
    pip install --upgrade pip && \
    pip install -r requirements.txt && \
    apt-get remove -y gcc && apt-get autoremove -y

# Expose Django's default runserver port
EXPOSE 8001

# Run the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8001"]


