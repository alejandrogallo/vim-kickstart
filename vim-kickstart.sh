#! /bin/bash
if [ "$(uname)" == "Darwin"  ] 
then
	__MAC__="TRUE"
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
fi


guess_right(){
	echo "$1 has been detected, I guess it is installed right"
}
add_plugin(){
	echo "Adding plugin $1 to .vimrc"
	link=$1
	cp .vimrc .vimrc.tmp
	cat .vimrc | perl -pe "s/(.*vundle#begin.*)/\1\nPlugin \'$link\'/g" > .vimrc.tmp
	#cat .vimrc.tmp
	mv .vimrc.tmp .vimrc

}

VUNDLE_URL="https://github.com/VundleVim/Vundle.vim"


ORIGIN=$PWD
echo "CD to $HOME"
cd $HOME

# CONTROL OF DIRECTORIES 
if test -d .vim
then 
	echo "Folder .vim detected..."
	if test -d .vim/bundle
	then
		echo "Folder .vim/bundle detected..."
	else
		echo "Folder .vim/bundle not detected... Creating it"
		mkdir .vim/bundle
	fi
else
	echo "Creating .vim folger..."
	mkdir .vim
fi


# INSTALLATION OF VUNDLE.VIM
echo "Installing Vundle.vim"
if test -e .vim/bundle/Vundle.vim
then
    guess_right Vundle.vim
else	
	echo "Vundle.vim not detected"
	echo "Getting Vundle from $VUNDLE_URL"
	git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
	echo -e "set nocompatible\nfiletype off\nset rtp+=~/.vim/bundle/Vundle.vim\ncall vundle#begin()\nPlugin 'VundleVim/Vundle.vim'\n\" All of your Plugins must be added before the following line\ncall vundle#end()\nfiletype plugin indent on\n">>.vimrc
	echo "Calling Vundle installation routine"
	vim +PluginInstall +qall 
fi


#INSTALL YOUCOMPLETEME
YCM_URL="https://github.com/Valloric/YouCompleteMe"
echo "Installing YouCompleteMe"
if [ __MAC__ ]
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

if test -e .vim/bundle/YouCompleteMe
then
   guess_right YouCompleteMe
else
 	echo "YouCompleteMe not detected, getting it from $YCM_URL"	
	git clone $YCM_URL ~/.vim/bundle/YouCompleteMe
	cd .vim/bundle/YouCompleteMe
	git submodule update --init --recursive
	python ~/.vim/bundle/YouCompleteMe/install.py --clang-completer
	cd ~ 
	add_plugin "Valloric\/YouCompleteMe"
	vim +PluginInstall +qall 

fi



#INSTALL NERDTREE
NERDTREE_URL="https://github.com/scrooloose/nerdtree.git"
echo "Installing NERDTREE..."
if test -d ~/.vim/bundle/nerdtree
then
	guess_right nerdtree
else	
	git clone $NERDTREE_URL ~/.vim/bundle/nerdtree
	add_plugin "scrooloose\/nerdtree"
	vim +Helptags +PluginInstall +qall 
fi

#INSTALL AIRLINE
AIRLINE_URL="https://github.com/bling/vim-airline.git"
echo "Installing vim-airline..."
if test -d ~/.vim/bundle/vim-airline
then
	guess_right vim-airline
else
	git clone $AIRLINE_URL ~/.vim/bundle/vim-airline
	add_plugin "bling\/vim-airline"
	echo "let g:airline#extensions#tabline#enabled = 1" >> ~/.vimrc
	echo "noremap <Tab> :bn<CR>" >> ~/.vimrc
	echo "noremap <Tab-S> :bp<CR>" >> ~/.vimrc
	vim +PluginInstall +qall
fi

#INSTALL SnipMate.vim
plug_name="vim-snipmate"
echo "Installing vim-snipmate"
if test -d ~/.vim/bundle/SnipMate.vim
then 
	guess_right SnipMate.vim
else
	add_plugin 'MarcWeber/vim-addon-mw-utils'
	add_plugin 'tomtom/tlib_vim'
	add_plugin 'garbas/vim-snipmate'
	#Optional
	add_plugin 'honza/vim-snippets'
	echo "\" SnipMate.vim CONFIGURATION">>~/.vimrc
	echo "ino <c-j> <c-r>=TriggerSnippet()<cr>" >> ~/.vimrc
	echo "snor <c-j> <esc>i<right><c-r>=TriggerSnippet()<cr>" >> ~/.vimrc
	vim +PluginInstall +qall
fi

plug_name="mattn/emmet-vim"
echo "Installing $plug_name"
if test -d ~/.vim/bundle/$plug_name
then 
	guess_right $plug_name

else
	add_plugin $plug_name
	vim +PluginInstall +qall
fi



cd $ORIGIN
