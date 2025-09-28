#!/bin/bash

mkdir -p /data

# Write config without password
echo "{
  \"port\": $PORT,
  \"dataDir\": \"/data\"
}" > /app/config.json

# Start server
actual-server --config /app/config.json
