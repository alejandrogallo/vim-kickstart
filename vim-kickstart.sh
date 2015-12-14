#! /bin/bash
VIMRC="$HOME/.vimrc"
VIM_FOLDER="$HOME/.vim"
VIM_INSTALL_FOLDER="$VIM_FOLDER/bundle"
if [ "$(uname)" == "Darwin"  ] 
then
	__MAC__="TRUE"
	__LINUX__=""
	echo "We are on a MAC, yeah"
	echo "We use brew for some stuff.. Maybe you should uninstall MacPorts and Fink if they are on the system."
	echo "Checking for HomeBrew.."
	if [ $(which brew)  ]
	then 
		echo "Brew detected"
	else 
		echo "Brew not detected, install it, go to http://brew.sh"
		exit 1
	fi
else
	__MAC__=""
	__LINUX__="TRUE"
fi


installing(){
	echo -e "\n\n====> INSTALLING $1 <===="
}
already_installed(){
	echo -e "\t---> Package $1 already installed \n\t\t(erase the files in $VIM_INSTALL_FOLDER/ to trigger the installation)"
}
add_plugin(){
	echo "Adding plugin $1 to .vimrc"
	link=$1
	cp .vimrc .vimrc.tmp
	cat .vimrc | perl -pe "s/(.*vundle#begin.*)/\1\nPlugin \'$link\'/g" > .vimrc.tmp
	#cat .vimrc.tmp
	mv .vimrc.tmp .vimrc

}

add_config() {
	text=$@
	echo $@ >> $VIMRC	
}

intall_with_vundle(){
	echo "Calling Vundle installation routine"
	vim +PluginInstall +qall 
}


VUNDLE_URL="https://github.com/VundleVim/Vundle.vim"


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
	echo "Creating .vim folger..."
	mkdir .vim
fi


# INSTALLATION OF VUNDLE.VIM
installing Vundle.vim
if test -e $VIM_INSTALL_FOLDER/Vundle.vim
then
    already_installed Vundle.vim
else	
	echo "Vundle.vim not detected"
	echo "Getting Vundle from $VUNDLE_URL"
	git clone https://github.com/VundleVim/Vundle.vim $VIM_INSTALL_FOLDER/Vundle.vim
	echo -e "set nocompatible\nfiletype off\nset rtp+=$VIM_INSTALL_FOLDER/Vundle.vim\ncall vundle#begin()\nPlugin 'VundleVim/Vundle.vim'\n\" All of your Plugins must be added before the following line\ncall vundle#end()\nfiletype plugin indent on\n">>.vimrc
	add_config "set nocompatible"
	add_config "filetype off"
	add_config "set rtp+=$VIM_INSTALL_FOLDER/Vundle.vim"
	add_config "call vundle#begin()"
	add_config "Plugin 'VundleVim/Vundle.vim'"
	add_config "\" All of your Plugins must be added before the following line"
	add_config "call vundle#end()"
	add_config "filetype plugin indent on"
	intall_with_vundle
fi


#INSTALL YOUCOMPLETEME
YCM_URL="https://github.com/Valloric/YouCompleteMe"
installing YouCompleteMe
if [ $__MAC__ ]
then 
	echo "We need MacVim"
	if [ $(which mvim) ]
	then 
		echo "MacVim (mvim) detected..."
	else 
		echo "MacVim (mvim) not detected... Installing it"
		brew install MacVim
	fi
fi

if test -e $VIM_INSTALL_FOLDER/YouCompleteMe
then
   already_installed YouCompleteMe
else
 	echo "YouCompleteMe not detected, getting it from $YCM_URL"	
	git clone $YCM_URL $VIM_INSTALL_FOLDER/YouCompleteMe
	cd $VIM_INSTALL_FOLDER/YouCompleteMe
	git submodule update --init --recursive
	python install.py --clang-completer
	cd ~ 
	add_plugin "Valloric\/YouCompleteMe"
	intall_with_vundle

fi



#INSTALL NERDTREE
NERDTREE_URL="https://github.com/scrooloose/nerdtree.git"
installing NERDTree
if test -d $VIM_INSTALL_FOLDER/nerdtree
then
	already_installed nerdtree
else	
	git clone $NERDTREE_URL $VIM_INSTALL_FOLDER/nerdtree
	add_plugin "scrooloose\/nerdtree"
	intall_with_vundle
fi

#INSTALL AIRLINE
AIRLINE_URL="https://github.com/bling/vim-airline.git"
installing VIM-AIRLINE
if test -d $VIM_INSTALL_FOLDER/vim-airline
then
	already_installed vim-airline
else
	git clone $AIRLINE_URL $VIM_INSTALL_FOLDER/vim-airline
	add_plugin "bling\/vim-airline"
	add_config "let g:airline#extensions#tabline#enabled = 1" 
	add_config "noremap <Tab> :bn<CR>" 
	add_config "noremap <Tab-S> :bp<CR>" 
	intall_with_vundle
fi

#INSTALL SnipMate.vim

folder_name='vim-snipmate'
plug_name='garbas\/vim-snipmate'
installing vim-snipmate
if test -d $VIM_INSTALL_FOLDER/$folder_name
then 
	already_installed SnipMate.vim
else
	add_plugin 'MarcWeber\/vim-addon-mw-utils'
	add_plugin 'tomtom\/tlib_vim'
	add_plugin $plug_name
	#Optional
	add_plugin 'honza\/vim-snippets'
	add_config "\" SnipMate.vim CONFIGURATION"
	add_config "ino <c-j> <c-r>=TriggerSnippet()<cr>"
	add_config "snor <c-j> <esc>i<right><c-r>=TriggerSnippet()<cr>" 
	intall_with_vundle
fi

folder_name="emmet-vim"
plug_name="mattn\/emmet-vim"
installing $plug_name
if test -d $VIM_INSTALL_FOLDER/$folder_name
then 
	already_installed $plug_name

else
	add_plugin $plug_name
	intall_with_vundle
fi



cd $ORIGIN
