# Use an official Nginx runtime as a parent image 
FROM python:3.9-slim
# Copy custom configuration file from the current directory
WORKDIR /NEW-DEMO-JENKINS
# Expose port 80 to allow outside access to Nginx 
COPY . /NEW-DEMO-JENKINS/
# Start Nginx when the container launches 



