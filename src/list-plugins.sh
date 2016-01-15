#!/bin/bash

SCRIPT_DIR=$(dirname $0) 

grep "Plugin " "$SCRIPT_DIR/../files/.vimrc"  | sed -e "s+[a-z]*[0-9]*/++" -e "s/Plugin//" | tr -d "'" | tr -d " "
