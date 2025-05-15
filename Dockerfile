# Use a lighter Python base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy the rest of the app
COPY . .

# Expose the app port
EXPOSE 5005

# Run the app
CMD ["python", "app.py"]
