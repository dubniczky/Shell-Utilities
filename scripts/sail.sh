#!/bin/bash

# https://github.com/dubniczky/Shell-Utilities
# Manage docker daemon


start_time=$(date +%s)

# Determine controller scripts
sysctl=$(command -v systemctl)
start_command=""
stop_command=""
if [ ! -z "$(command -v systemctl)" ]; then
    # Linux mode (systemd)
    start_command="sudo systemctl start docker"
    stop_command="sudo systemctl stop docker"
elif [ ! -z "$(command -v service)" ]; then
    # Linux mode (service)
    start_command="sudo service docker start"
    stop_command="sudo service docker stop"
else
    # Mac mode
    start_command="open --background -a Docker"
    stop_command="killall Docker"
fi

# Run mode
if [ "$1" = "up" ]; then
    echo "Starting Docker..."
    $start_command
elif [ "$1" = "down" ]; then
    echo "Docker Stopped."
    $stop_command
    exit 0
else
    echo "Usage: docker [up|down]"
    exit 0
fi

# Wait for start
while ! docker system info > /dev/null 2>&1; do sleep 1; done

# Print status
end_time=$(date +%s)
runtime=$((end_time-start_time))
echo "Docker daemon started in ${runtime}s"
