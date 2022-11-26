#!/bin/bash

# https://github.com/dubniczky/Shell-Utilities
# Utility to install scripts to binaries


default_target="/usr/local/bin"

install_target=${1:-$default_target}
install_target=$(realpath $install_target)

# Make scripts user runnable
chmod +x scripts/*

# Install scripts
cd scripts
for file in *; do
    base_name=$(echo $file | cut -d "." -f 1)
    cp -f $file "$install_target/$base_name"
done
cd ..

# Displaty
echo "Installed $(ls scripts | wc -l | xargs echo) scripts to $install_target"
