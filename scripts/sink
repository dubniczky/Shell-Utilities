#!/bin/bash

# https://github.com/dubniczky/Shell-Utilities
# Kill all currently running docker containers

CONTAINER_IDS=$(docker ps -q)

if [ -z "$CONTAINER_IDS" ]; then
    echo "No containers running."
else
    docker kill $CONTAINER_IDS > /dev/null
    echo "Stopped $(echo "$CONTAINER_IDS" | wc -l | xargs echo) containers."
fi
