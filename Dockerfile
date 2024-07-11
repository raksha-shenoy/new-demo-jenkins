# Use an official Nginx runtime as a parent image 
FROM nginx:latest 
# Copy custom configuration file from the current directory
COPY nginx.conf /etc/nginx/nginx.conf 
# Expose port 80 to allow outside access to Nginx 
EXPOSE 80 
# Start Nginx when the container launches 
CMD ["nginx", "-g", "daemon off;"]