# Use a lightweight web server
FROM nginx:alpine

# Copy a custom HTML file into the server
COPY index.html /usr/share/nginx/html/index.html
