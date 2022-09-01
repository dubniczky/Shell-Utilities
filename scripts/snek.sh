#!/bin/bash

# https://github.com/dubniczky/Shell-Utilities
# Activate given python version as the python command


# Check for help
if [ "$1" = "-h" ] || [ "$1" = "--help" ] || [ "$1" = "help" ]; then
    echo "Activate given python version as the python and pip commands, or show currently active version"
    echo "Usage: snek [version?]"
    echo "   version: Major dot minor version numbers of python to activate"
    echo "Examples:"
    echo "   snek - show current version"
    echo "   snek 3.10 - switch to 3.10 if installed"
    exit 0
fi

# Check for display or update mode
if [ "$#" -ne 1 ]; then
    echo "$(python -V  | sed -e "s/^Python //")"
    exit 0
fi

# Locate python binary
pybin_loc="$(command -v python$1)"
if [ -z $pybin_loc ]; then
    echo "ERROR: python$1 binary not found."
    exit 1
fi

# Locate pip binary
pipbin_loc="$(command -v pip$1)"
if [ -z $pipbin_loc ]; then
    echo "WARNING: pip$1 binary not found, could not switch versions."
fi

# Overwrite soft links
ln -sf $pybin_loc /usr/local/bin/python
if [ ! -z $pipbin_loc ]; then
    ln -sf $pipbin_loc /usr/local/bin/pip
fi
