#!/bin/bash

# https://github.com/dubniczky/Shell-Utilities
# Utility install script to download and install the utilites


set -e

# Download repository to tmp
git clone https://github.com/dubniczky/Shell-Utilities /tmp/Shell-Utilities

# Run installer
chmod u+x /tmp/Shell-Utilities/install.sh
/tmp/Shell-Utilities/install.sh

# Clean up
rm -rf /tmp/Shell-Utilities

echo "Setup completed."
