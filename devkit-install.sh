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

# Create ~/.local/devkit
INSTALL_DIR=$HOME/.local/devkit

git clone https://github.com/42dev-co/devkit.git $INSTALL_DIR

if [ -d "$INSTALL_DIR/.git" ]; then
  rm -rf $INSTALL_DIR/.git
fi

bash $INSTALL_DIR/join.sh


# append to ~/.bashrc if devkit alias is not already present
if ! grep -q "alias devkit='task -t ~/.local/devkit/Taskfile.yml'" ~/.bashrc; then
  echo "alias devkit='task -t ~/.local/devkit/Taskfile.yml'" >> ~/.bashrc
else
  echo "devkit alias is already present in ~/.bashrc"
fi

