#!/bin/bash

# https://github.com/dubniczky/Shell-Utilities
# Utility to generate cryptographically secure random base16 strings


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

# The uuidgen command is generating a 33 character string
iterations=$(($rand_length / 33 + 1))

# Generate random string
rand_string=""
for i in $(seq 1 $iterations); do
    rand_iter=$(uuidgen | tr -d "-")
    rand_string="$rand_string$rand_iter"
done

# Trim to length
echo ${rand_string:0:$rand_length}
