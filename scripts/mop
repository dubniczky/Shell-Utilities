#!/bin/bash

# https://github.com/dubniczky/Shell-Utilities
# Clean up common temporary files and folders in the current directory


# Check for help
if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    echo "Clean up common temporary files and folders in the current directory."
    echo "Removes binaries, logs, archives, build files, other temporaries, and anything ingnored by git."
    echo "It is recommended to run this in a git project, to avoid deleting files that are not tracked."
    echo "Usage: mop"
    exit 0
fi


globs=(
# General
logs
*.log
out
.temp
*.cache
dist
build
*.tmp
*.tmp.*
*.~*
coverage
.coverage
*.sqlite*
packages
*.zip
*.tar
*.tar.gz
*.tar.bz2
*.tar.xz
*.tgz
*.tbz2
*.txz
*.rar
*.7z
*.gz

# Nodejs
node_modules
report.[0-9]*.[0-9]*.[0-9]*.[0-9]*.json
.grunt
bower_components
jspm_packages
*.tsbuildinfo
.npm
.eslintcache
*.tgz
.yarn-integrity
.next
.nuxt
*.sass-cache
.yarn/cache
.yarn/unplugged
.yarn/build-state.yml
.yarn/install-state.gz
.pnp.*
.webpack
.expo
__generated__

# Python
__pycache__
.pytest_cache
.venv
.Python
*.py[cod]
*.egg-info
*.egg
*.ipynb_checkpoints
develop-eggs
eggs
MANIFEST
*.manifest
pip-log.txt
pip-delete-this-directory.txt
.pybuilder
ipython_config.py
__pypackages__
*.sage.py
.pyre
.pytype

# C/C++/C#
[Bb]uild
[Dd]ebug
obj
bin
lib
lib64
*.out
*.o
*.so
*.i
*.ii
*.obj
*.dylib
*.dll
*.exe
*.app

# Go
vendor
Godeps
go.work
*.exe-*

# Security
*.prv
*.key
*.pem
*.p12
*.crt
*.p8
*.pkcs12


# OS Specific
.DS_Store
.DS_Store?
Thumbs.db
.AppleDouble
.LSOverride
Icon
.Trashes
ehthumbs.db
._*
.TemporaryItems
.Spotlight-V100
.VolumeIcon.icns
)

# Remove items
removed_items=$(rm -rfv ${globs[@]} 2> /dev/null)
#echo $removed_items

# Count removed items
count="0"
if [ ! -z "$removed_items" ]; then
    count=$(echo "$removed_items" | wc -l | xargs echo)
fi

# Remove other items ignored by git
if [ ! -z "$(command -v git)" ] && [ -f ".gitignore" ]; then
    git_items=$(git clean -fdX 2> /dev/null)
    if [ ! -z "$git_items" ]; then
        git_count=$(echo "$git_items" | wc -l | xargs echo)
        count=$((count+git_count))
    fi
fi

# Print summary
echo "Removed $count items."
