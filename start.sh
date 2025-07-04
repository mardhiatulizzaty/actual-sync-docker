#!/bin/bash

echo "{\"port\": $PORT}" > /app/config.json
actual-server --config /app/config.json
