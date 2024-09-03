#!/bin/bash

# Function to install or update devbox
install_or_update_devbox() {
  if command -v devbox &> /dev/null
  then
    echo "Devbox is already installed. Updating devbox..."
    devbox global update
  else
    echo "Devbox is not installed. Installing devbox..."
    curl -fsSL https://get.jetpack.io/devbox | bash
    eval "$(devbox global shellenv --preserve-path-stack -r)" && hash -r
  fi
}

# Step 1: Install or update devbox
install_or_update_devbox

# Step 2: Install go-task globally using devbox
devbox global add go-task

# Step 3: Download the main Taskfile.yml from GitLab
REPO_URL="https://raw.githubusercontent.com/42dev-co"
TASKFILE_URL="$REPO_URL/devkit/main/Taskfile.yml"

# Download the Taskfile.yml to the current directory
curl -o Taskfile.yml $TASKFILE_URL

# if includes.yml does not exist, create it
if [ ! -f "includes.yml" ]; then
  echo "version: '3'" > .includes.yml
fi

# Step 4: Initialize the environment
task init
