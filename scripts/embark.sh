#!/bin/bash

# https://github.com/dubniczky/Shell-Utilities
# Build the local Dockerfile and quick run it with customizable parameters


name="tempimage:latest"
port="8000:8000"

# Check for help
if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    echo "Build the local Dockerfile and quick run it with customizable parameters"
    echo ""
    echo "Usage: embark [container_name?] [ports?] [args...]"
    echo "   container_name: The name and tag of the image to build. Default: user/folder"
    echo "   ports: The source and destination ports to expose. Default: $port"
    echo "   args: All subsequent parameters will be passed to the docker run command."
    echo ""
    echo "Examples:"
    echo "   embark - build and run dockerfile with default name and port"
    echo "   embark myimage:latest 80:80 - build and run dockerfile with custom name"
    echo "   embark myimage:latest 80:80 -d - build and run dockerfile with custom name and daemon mode"
    exit 0
fi

# Assemble default container name
directory=${PWD##*/}
user=$(whoami)
name="$user/$directory:latest"

# Assign parameters
if [ ! -z $1 ]; then
    name=$1
fi

if [ ! -z $2 ]; then
    port=$2
fi

echo "Container name: $name"
echo "Container port: $port"

# Build the container
if [ -f "Dockerfile" ]; then
    docker build -t $name .
else
    echo "No Dockerfile found in current directory."
    exit 1
fi

# Run the container
docker run -p $port --rm "${@:3}" $name
