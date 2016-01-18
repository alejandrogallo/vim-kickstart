#!/bin/bash
#######################################################################
#          SCRIPT TO INSTALL SOME VIM PLUGINS AUTOMATICALLY           #
#######################################################################


################
#  PARAMETERS  #
################

VIMRC="$HOME/.vimrc"
VIM_FOLDER="$HOME/.vim"
VIM_INSTALL_FOLDER="$VIM_FOLDER/bundle"
PLUGIN_INSTALLED=""


##########################
#  FUNCTION DEFINITIONS  #
##########################


begin_install() {
  installing $plug_name
  if test -d $VIM_INSTALL_FOLDER/$folder_name; then 
    already_installed $plug_name
    PLUGIN_INSTALLED="True"
  else
    PLUGIN_INSTALLED=""
  fi
}

check_brew(){
  if which brew
  then 
    echo "Brew detected"
  else 
    echo "Brew not detected, install it, go to http://brew.sh"
    echo "Install it running:"
    echo 'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
    read -p "Press any key to continue, or get out with Ctrl-C"
  fi
}

installing(){
  echo -e "\n\n====> INSTALLING $1 <===="
}

already_installed(){
  echo -e "\t---> Package $1 already installed \n\t\t(erase the files in $VIM_INSTALL_FOLDER/ to trigger the installation)"
}

add_plugin(){
  if test -n "$1"; then 
    link=$1
  else
    link=$plug_name
  fi
  echo "Adding plugin $link to .vimrc"
  cp .vimrc .vimrc.tmp
  cat .vimrc | perl -pe "s/(.*vundle#begin.*)/\1\nPlugin \'$link\'/g" > .vimrc.tmp
  #cat .vimrc.tmp
  mv .vimrc.tmp .vimrc

}

add_config() {
  text=$@
  echo $@ >> $VIMRC	
}

install_with_vundle(){
  echo "Calling Vundle installation routine"
  vim +PluginInstall +qall 
}

recognise_os () {
  if [ "$(uname)" == "Darwin"  ] 
  then
    __MAC__="TRUE"
    echo "We are on a MAC, yeah"
    echo "We use brew for some stuff.. Maybe you should uninstall MacPorts and Fink if they are on the system."
    echo "Checking for HomeBrew.."
    check_brew
  else
    __LINUX__="TRUE"
  fi
}

###########################################
#  RECOGNISE OPERATING SYSTEM
###########################################

recognise_os



###########################################
#  CONTROL OF VIM FOLDERS AND CONF FILES  #
###########################################

ORIGIN=$PWD
echo "CD to $HOME"
cd $HOME

# CONTROL OF DIRECTORIES 
if test -d $VIM_FOLDER
then 
  echo "Folder .vim detected..."
  if test -d $VIM_INSTALL_FOLDER
  then
    echo "Folder $VIM_INSTALL_FOLDER detected..."
  else
    echo "Folder $VIM_INSTALL_FOLDER not detected... Creating it"
    mkdir $VIM_INSTALL_FOLDER
  fi
else
  echo "Creating .vim folder..."
  mkdir .vim
fi


####################################
#  INSTALL PACKAGE MANAGER VUNDLE  #
####################################

VUNDLE_URL="https://github.com/VundleVim/Vundle.vim"
installing Vundle.vim
if test -e $VIM_INSTALL_FOLDER/Vundle.vim
then
  already_installed Vundle.vim
else	
  echo "Vundle.vim not detected"
  echo "Getting Vundle from $VUNDLE_URL"
  git clone $VUNDLE_URL $VIM_INSTALL_FOLDER/Vundle.vim
  add_config "\" VUNDLE.VIM CONFIGURATION BEGIN"
  add_config "set nocompatible"
  add_config "filetype off"
  add_config "set rtp+=$VIM_INSTALL_FOLDER/Vundle.vim"
  add_config "call vundle#begin()"
  add_config "Plugin 'VundleVim/Vundle.vim'"
  add_config "\" All of your Plugins must be added before the following line"
  add_config "call vundle#end()"
  add_config "\" VUNDLE.VIM CONFIGURATION END"
  add_config ""
  install_with_vundle
fi


####################
##  YouCompleteMe  #
####################

#YCM_URL="https://github.com/Valloric/YouCompleteMe"
#installing YouCompleteMe
#if [ $__MAC__ ]
#then 
#echo "We need MacVim"
#if [ $(which mvim) ]
#then 
#echo "MacVim (mvim) detected..."
#else 
#echo "MacVim (mvim) not detected... Installing it"
#brew install MacVim
#fi
#fi

#if test -e $VIM_INSTALL_FOLDER/YouCompleteMe
#then
#already_installed YouCompleteMe
#else
#echo "YouCompleteMe not detected, getting it from $YCM_URL"	
#git clone $YCM_URL $VIM_INSTALL_FOLDER/YouCompleteMe
#cd $VIM_INSTALL_FOLDER/YouCompleteMe
#git submodule update --init --recursive
#python install.py --clang-completer
#cd ~ 
#add_plugin "Valloric\/YouCompleteMe"
#install_with_vundle

#fi



##############
#  NerdTree  #
##############

folder_name="nerdtree"
plug_name="scrooloose\/nerdtree"
begin_install
if test -z "$PLUGIN_INSTALLED"; then
  add_plugin 
  install_with_vundle
fi

##############
#  AIRLINE   #
##############

folder_name="vim-airline"
plug_name="bling\/vim-airline"
begin_install
if test -z "$PLUGIN_INSTALLED"; then
  add_plugin 
  install_with_vundle
fi


########################################
#  Install Emmet for vim (html stuff)  #
########################################

folder_name="emmet-vim"
plug_name="mattn\/emmet-vim"
begin_install
if test -z "$PLUGIN_INSTALLED"; then
  add_plugin $plug_name
  install_with_vundle
fi



#######################
#  INSTALL UltiSnips  #
#######################

folder_name="ultisnips"
plug_name="SirVer\/ultisnips"
begin_install
if test -z "$PLUGIN_INSTALLED"; then
  # UltiSnips needs at least vim 7.4.x to work
  # check it 
  if vim --version | grep 7.4
  then
    add_plugin
    install_with_vundle
  else
    echo "UltiSnips (the nice program for autocompleting code) needs at least vim 7.4 to work"
    echo "It is anyways a good idea to install a newer vim version"
    read -p "Press any key to continue... " 
  fi
fi


##################
#  VIM-SNIPPETS  #
##################

folder_name="vim-snippets"
plug_name='honza\/vim-snippets'
begin_install
if test -z "$PLUGIN_INSTALLED"; then
  add_plugin
  install_with_vundle
fi


################################
#  NERDCOMMENTER INSTALLATION  #
################################

folder_name="nerdcommenter"
plug_name="scrooloose\/nerdcommenter"
begin_install
if test -z "$PLUGIN_INSTALLED"; then
  add_plugin 
  install_with_vundle 
fi



##################
#  BUFFEXPLORER  #
##################

folder_name="bufexplorer"
plug_name="jlanzarotta\/bufexplorer"
begin_install
if test -z "$PLUGIN_INSTALLED"; then
  add_plugin
  install_with_vundle
fi


##############
#  SuperTab  #
##############

folder_name="supertab"
plug_name="ervandew\/supertab"
begin_install
if test -z "$PLUGIN_INSTALLED"; then
  add_plugin
  install_with_vundle
fi

#################
#  NeoComplete  #
#################

folder_name="neocomplete.vim"
plug_name="Shougo\/neocomplete.vim"
begin_install
if test -z "$PLUGIN_INSTALLED"; then
  # Neocomplete needs vim with lua support
  # We have to Test it !
  if vim --version | grep +lua 
  then 
    add_plugin
    install_with_vundle
  else
    echo "$folder_name needs vim compiled with lua, and your vim version does not have it. (check vim --version for flags)"
    if test -n "$__MAC__"
    then
      echo -e 'Try removing your vim with \n\t brew uninstall vim'
      echo -e 'Install vim with lua:\n\t brew install vim --with-lua'
    else
      echo "The packages vim-nox, vim-gtk, vim-gnome and vim-athena are built with lua dependencies"
    fi
    read -p "Press any key to continue... " 
  fi
fi

####################
#  VIM-TABLE-MODE  #
####################

folder_name="vim-table-mode"
plug_name="dhruvasagar\/vim-table-mode"
begin_install
if test -z "$PLUGIN_INSTALLED"; then
  add_plugin
  install_with_vundle
fi


##############
#  VASP.VIM  #
##############

folder_name="vasp.vim"
plug_name="alejandrogallo\/vasp.vim"
begin_install
if test -z "$PLUGIN_INSTALLED"; then
  add_plugin
  install_with_vundle
fi


###############
#  COMMAND T  #
###############

folder_name="command-t"
plug_name="wincent\/command-t"
begin_install
if test -z "$PLUGIN_INSTALLED"; then
  add_plugin
  install_with_vundle
fi



cd $ORIGIN
