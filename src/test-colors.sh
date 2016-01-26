#!/bin/sh


for color in  $HOME/.vim/bundle/vim-colorschemes/colors/*;
do name=$(basename "$color" .vim);
  echo $name ;
  read ;
  vim +"color $name" server.py;
done
