#!/bin/bash

SCRIPT_DIR=$(dirname $0) 
REPO_VIM_FILE="$SCRIPT_DIR/../files/.vimrc"
LOCAL_VIM_FILE="$HOME/.vimrc"

test -f $REPO_VIM_FILE || (echo "NO REPO VIMRC at $REPO_VIM_FILE found" && exit 1)
test -f $LOCAL_VIM_FILE || (echo "NO LOCAL VIMRC at $LOCAL_VIM_FILE found" && exit 1)

echo "Copying $REPO_VIM_FILE into $LOCAL_VIM_FILE"
cp $REPO_VIM_FILE $LOCAL_VIM_FILE 
