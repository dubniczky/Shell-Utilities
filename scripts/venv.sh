#!/bin/bash

# https://github.com/dubniczky/Shell-Utilities
# Initialize a python virtual environment and install packages

VENV_NAME=".venv"
VENV_DEPS="requirements.txt"
PYTHON_VERSION="3"

# Help
if [ "$1" = "help" ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    echo "Usage: venv [name?] [version?]"
    echo "   name: The name of the virtual environment folder. Default: $VENV_NAME"
    echo "   version: The version of python to use. Default: $PYTHON_VERSION"
    exit 0
fi

# Assign parameters
if [ ! -z $1 ]; then
    VENV_NAME=$1
fi
if [ ! -z $1 ]; then
    PYTHON_VERSION=$1
fi

# Check python installation and create venv
echo "Creating virtual environment... ($VENV_NAME/)"
python$PYTHON_VERSION -m venv "$VENV_NAME"
if [ $? -ne 0 ]; then
    echo "Failed to create virtual environment."
    exit 1
fi

# Install packages with pip
echo "Installing packages... (/$VENV_DEPS)"
if [ -f "$VENV_DEPS" ]; then
    echo "Installing dependencies from requirements file..."
    ./$VENV_NAME/bin/pip install -r $VENV_DEPS
else
    echo "No requirements file found, skipping install."
    echo "Created requirements file: $VENV_DEPS"
fi

# Show instructions
echo "Environment loaded!"
echo ""
echo "Activate:"
echo ". $VENV_NAME/bin/activate"
