#!/bin/bash

# https://github.com/dubniczky/Shell-Utilities
# Search for each git repository in current folder and pull new changes


# Check for help
if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    echo "Search for each git repository in current folder and pull new changes"
    echo ""
    echo "Usage: $0 [directory?]"
    echo "   directory: Directory to search for git repositories (default: current directory)"
    echo ""
    echo "Examples:"
    echo "   $0 - search for all git repositories in the current directory and issue git pull for each"
    echo "   $0 ~/Projects - search for git repositories and pull them in this path: ~/Projects"
    exit 0
fi


c_red='\033[0;31m'
c_green='\033[0;32m'
c_none='\033[0m'
start_time=$(date +%s)

# Move to directory if it was specified
start_dir=$(pwd)
if [ "$#" -eq 1 ]; then
    cd "$1"
fi

# Find repositories
repo_paths=$(find . -name .git -type d -prune -exec dirname {} \;)
echo "Found $( echo $repo_paths | wc -w | xargs echo ) repositories in $(pwd):"
#echo $repo_paths

# Pull repositories
repos=(`echo ${repo_paths}`)
pwd=$(pwd)
for repo in "${repos[@]}"; do
    echo -n " | Pulling $(echo $repo | sed "s|./||") "
    cd $repo
    git pull --all --quiet origin >/dev/null 2>&1 && \
        git pull --tags >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo -e " - ${c_green}success${c_none}"
    else
        echo -e " - ${c_red}failed${c_none}"
    fi
    cd $pwd
done
cd $start_dir

# Display performance
end_time=$(date +%s)
runtime=$((end_time-start_time))
echo "Done in ${runtime}s"
