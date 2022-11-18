#!/bin/bash

# https://github.com/dubniczky/Shell-Utilities
# Quick download a git repository to a local projects folder by name


projects_folder="$HOME/projects"
repository_url="git@github.com:dubniczky/"
repository_suffix=".git"


# Display help
if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    echo "Usage: gitget [repository]"
    echo "   repository: Name of the repository"
    exit 0
fi

# Check parameter
if [ -z "$1" ]; then
    echo "Error: Missing repository name" >&2
    exit 1
fi

# Check projects folder
local_path="$projects_folder/$1"
if [ ! -d "$local_path" ]; then
    cd "$projects_folder"
    git clone "$repository_url$1$repository_suffix"
else
    cd "$local_path"
    git pull
fi
