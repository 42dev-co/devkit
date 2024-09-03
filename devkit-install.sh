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
devbox global add go-task gomplate

# Step 3: Download the main Taskfile.yml from GitLab
REPO_URL="https://raw.githubusercontent.com/42dev-co"
TASKFILE_URL="$REPO_URL/devkit/main/Taskfile.yml.tmpl"

# Create ~/.local/devkit
mkdir $HOME/.local/devkit
INSTALL_DIR=$HOME/.local/devkit

# Download the Taskfile.yml to the current directory
curl -o $INSTALL_DIR/Taskfile.yml.tmpl $TASKFILE_URL

# Concatenate includes if exists
if [ -f "$INSTALL_DIR/include.yml" ]; then
  cat $INSTALL_DIR/Taskfile.yml.tmpl $INSTALL_DIR/include.yml > $INSTALL_DIR/Taskfile.yml
else
  cat $INSTALL_DIR/Taskfile.yml.tmpl > $INSTALL_DIR/Taskfile.yml 
fi
