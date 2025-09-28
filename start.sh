#!/bin/bash

# Create persistent data directory if it doesn't exist
mkdir -p /data

# Check if password is set via environment variable
if [ -z "$SYNC_PASSWORD" ]; then
  echo "ERROR: SYNC_PASSWORD environment variable not set"
  exit 1
fi

# Write config.json using Render PORT and password from env
echo "{
  \"port\": $PORT,
  \"auth\": { \"password\": \"$SYNC_PASSWORD\" },
  \"dataDir\": \"/data\"
}" > /app/config.json

# Start the Actual Budget sync server
actual-server --config /app/config.json
