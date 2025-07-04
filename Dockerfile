FROM node:20

# Install the sync server globally
RUN npm install -g @actual-app/sync-server

# Create app directory
WORKDIR /app

# Add entrypoint that writes config and runs server
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
