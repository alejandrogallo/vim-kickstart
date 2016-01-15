#!/bin/sh

plugin_name=$1
if test -z $plugin_name
then
  echo "usage: $0 <plugin-name>"
  exit 1
fi

plugin_folder="$HOME/.vim/bundle/$plugin_name"
if test -d $plugin_folder
then
  echo "Removing folder $plugin_folder"
  rm -rf $plugin_folder || exit 1
else
  echo "$plugin_folder not found, maybe you have the plugin somewhere else"
  exit 1
fi


