#!/bin/bash

# https://github.com/dubniczky/Shell-Utilities
# Utility to install scripts to binaries


INSTALL_TARGET="/usr/local/bin"

# Make scripts user runnable
chmod +x scripts/*

# Install scripts
cd scripts
for file in *; do
    base_name=$(echo $file | cut -d "." -f 1)
    cp -f $file "$INSTALL_TARGET/$base_name"
done
cd ..

# Displaty
echo "Installed $(ls scripts | wc -l | xargs echo) scripts to $INSTALL_TARGET"
