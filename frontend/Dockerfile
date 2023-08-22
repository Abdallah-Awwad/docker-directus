# # Use an official Nginx image as a parent image
# FROM nginx:alpine

# # Copy the static files to the container
# COPY . /usr/share/nginx/html

# # Expose port 80 for HTTP traffic
# EXPOSE 80

# # Start the Nginx server
# CMD ["nginx", "-g", "daemon off;"]

# Use a base image
FROM nginx

# Remove the default Nginx configuration file
RUN rm /etc/nginx/conf.d/default.conf

# Copy the custom Nginx configuration file
COPY nginx.conf /etc/nginx/conf.d/

# Copy the frontend files to the Nginx document root
COPY public /usr/share/nginx/html

# Expose the desired port
EXPOSE 8081

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]