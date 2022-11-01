#!/bin/bash

# https://github.com/dubniczky/Shell-Utilities
# Utility to generate cryptographically secure random base64 strings


rand_length=16 # Default length
script_name=$(basename $0)

# Parse arguments
if [ "$1" = "help" ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    echo "Usage: $script_name [length?]"
    echo "   length: The length of the random string. Default: $rand_length"
    exit 0
elif [ ! -z $1 ]; then
    rand_length=$1
    if ! [[ $rand_length =~ ^[1-9][0-9]*$ ]]; then
        echo "Error: Invalid length" >&2
        exit 1
    fi
fi

# Increase sampling buffer size to push out the base64 = or == padding
buf_length=$(($rand_length + 3))

# Generate random string
cat /dev/urandom \
    | head -c $buf_length \
    | base64 \
    | head -c $rand_length \
    | xargs echo
