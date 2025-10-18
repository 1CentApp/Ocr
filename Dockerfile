# Use official Python image
FROM python:3.12-slim

# Install tesseract-ocr
RUN apt-get update && \
    apt-get install -y tesseract-ocr libtesseract-dev && \
    rm -rf /var/lib/apt/lists/*

# Set work directory
WORKDIR /app

# Copy files
COPY requirements.txt requirements.txt
COPY app.py app.py

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port Railway will use
EXPOSE 5000

# Start the Flask app
CMD ["python", "app.py"]
