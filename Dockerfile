FROM nginx:alpine

# Clear default nginx html
RUN rm -rf /usr/share/nginx/html/*

# Copy all HTML files from project root to nginx html folder
COPY ./ /usr/share/nginx/html/

# Expose container port
EXPOSE 80

# Start Nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
