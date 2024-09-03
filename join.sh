#!/bin/bash
INSTALL_DIR=$HOME/.local/devkit
# Concatenate includes if exists
if [ -f "$INSTALL_DIR/include.yml" ]; then
  cat $INSTALL_DIR/Taskfile.yml.tmpl $INSTALL_DIR/include.yml >| $INSTALL_DIR/Taskfile.yml
else
  cat $INSTALL_DIR/Taskfile.yml.tmpl >| $INSTALL_DIR/Taskfile.yml 
fi


