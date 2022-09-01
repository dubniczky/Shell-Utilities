#!/bin/bash

# https://github.com/dubniczky/Shell-Utilities
# Utility install script


install_target="/usr/local/bin"

# Make scripts user runnable
chmod +x scripts/*

# Install scripts
#cp -f scripts/* $install_target
cd scripts
for file in *; do
    base_name=$(echo $file | cut -d "." -f 1)
    cp -f $file "$install_target/$base_name"
done
cd ..

# Displaty
echo "Installed $(ls scripts | wc -l | xargs echo) scripts to $install_target"
