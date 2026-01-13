# Use nginx to serve static content
FROM nginx:alpine

# Copy everything in the project into nginx web root
COPY . /usr/share/nginx/html/

# Expose web port
EXPOSE 80
