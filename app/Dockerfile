# Base image
FROM python:3.11-alpine

# Set working directory inside the container
WORKDIR /app

# Copying dependecy file. Dependencies are reinstalled if requirements.txt change
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application source code
COPY app.py .

# Expose port 5000 for Flask app 
EXPOSE 5000

# Run app with gunicorn. Sigle worker for demo purpose
CMD [ "gunicorn", "--bind", "0.0.0.0:5000", "--workers", "1", "app:app" ]