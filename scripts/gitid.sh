#!/bin/bash

# https://github.com/dubniczky/Shell-Utilities
# Change the commit identity of the current git repository


# Check for help
if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    echo "Change the commit identity of the current git repository"
    echo ""
    echo "Usage: gitid [email?] [name?]"
    echo "   email: Email address to set (user.email)"
    echo "   name: User name to set (user.name)"
    echo ""
    echo "Examples:"
    echo "   gitid - show current email and name"
    echo "   gitid claire@boomers.com \"Claire Boomers\" - set email and name"
    exit 0
fi


# Show config
if [ "$#" -ne 2 ]; then
    git config -l | grep user.email
    git config -l | grep user.name
    exit 0
fi

# Update config
git config user.email "$2"
git config user.name "$1"
