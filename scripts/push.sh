#!/bin/bash

# https://github.com/dubniczky/Shell-Utilities
# Search for each git repository in current folder and push the commits


# Check for help
if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    echo "Search for each git repository in current folder and push the commits"
    echo ""
    echo "Usage: push [directory?]"
    echo "   directory: Directory to search for git repositories (default: current directory)"
    echo ""
    echo "Examples:"
    echo "   push - search for git repositories and push them in current directory"
    echo "   push ~/Projects - search for git repositories and push them in ~/Projects"
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

# Push repositories
repos=(`echo ${repo_paths}`)
pwd=$(pwd)
for repo in "${repos[@]}"; do
    echo -n " | Pushing $(echo $repo | sed "s|./||") "
    cd $repo
    git push --all --quiet origin >/dev/null 2>&1 && \
        git push --tags >/dev/null 2>&1
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
