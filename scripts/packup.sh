#!/bin/bash

# https://github.com/dubniczky/Shell-Utilities
# Update various packages and applications from multiple sources


# Homebrew
if [ -x "$(command -v brew)" ]; then
    echo "Updating Homebrew..."
    brew update
    brew upgrade
    brew cleanup
fi

# Homebrew Intel Edition
if [ -x "$(command -v ibrew)" ]; then
    echo "Updating iHomebrew..."
    ibrew update
    ibrew upgrade
    ibrew cleanup
fi

# Pnpm global packages
if [ -x "$(command -v pnpm)" ]; then
    echo "Updating Pnpm..."
    pnpm update --latest --global
fi

# Pnpm global packages
if [ -x "$(command -v pip)" ]; then
    echo "Updating Python packages..."
    pip install --upgrade pip
    pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 $PM_PYTHON install -U
fi

# Tldr help database
if [ -x "$(command -v tldr)" ]; then
    echo "Updating TLDR help database..."
    pip install --upgrade pip
    pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 $PM_PYTHON install -U
fi
