# # Use an official Nginx runtime as a parent image 
# FROM python:3.9-slim
# # Copy custom configuration file from the current directory
# WORKDIR /NEW-DEMO-JENKINS
# # Expose port 80 to allow outside access to Nginx 
# COPY . /NEW-DEMO-JENKINS/




# Dockerfile

# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

EXPOSE 8080

# Run script.py when the container launches
CMD ["python", "./script.py"]