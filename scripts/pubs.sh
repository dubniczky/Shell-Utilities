#!/bin/bash

# https://github.com/dubniczky/Shell-Utilities
# Utility that prints the piblic ssh key of the current user or the specified user

KEY_LOC=".ssh/id_rsa.pub"

KEY_FILE=""
USERNAME=""

# Locate key file
if [ -z $1 ]; then
    KEY_FILE="$HOME/$KEY_LOC"
    USERNAME=$(whoami)
else
    USER_HOME=$(eval echo "~$1")
    KEY_FILE="$USER_HOME/$KEY_LOC"
    USERNAME="$1"
fi

# Write if exists
if [ -f $KEY_FILE ]; then
    cat ~/$KEY_LOC
else
    echo "No ssh key exists for user: $USERNAME"
fi
