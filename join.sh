#!/bin/bash
INSTALL_DIR=$HOME/.local/devkit
# Concatenate includes if exists
if [ -f "$INSTALL_DIR/includes.yml" ]; then
  cat $INSTALL_DIR/Taskfile.yml.tmpl $INSTALL_DIR/includes.yml >| $INSTALL_DIR/Taskfile.yml
else
  cat $INSTALL_DIR/Taskfile.yml.tmpl >| $INSTALL_DIR/Taskfile.yml 
fi


