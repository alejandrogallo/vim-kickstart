#!/bin/bash

SCRIPT_DIR=$(dirname $0) 
REPO_VIM_FILE="$SCRIPT_DIR/../files/.vimrc"
LOCAL_VIM_FILE="$HOME/.vimrc"

test -f $REPO_VIM_FILE || (echo "NO REPO VIMRC at $REPO_VIM_FILE found" && exit 1)
test -f $LOCAL_VIM_FILE || (echo "NO LOCAL VIMRC at $LOCAL_VIM_FILE found" && exit 1)

echo "Copying $LOCAL_VIM_FILE into $REPO_VIM_FILE"
cp $LOCAL_VIM_FILE $REPO_VIM_FILE
