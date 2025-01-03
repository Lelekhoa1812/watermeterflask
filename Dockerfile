# Use a lightweight Python image as the base
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory in the container
WORKDIR /app

# Copy only the necessary files
COPY requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . /app/

# Expose the port that Flask will run on
EXPOSE 5000

# Specify the command to run the Flask app
CMD ["gunicorn", "--bind", "0.0.0.0:5001", "app:app"]
