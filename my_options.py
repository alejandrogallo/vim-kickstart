
from options import OneLiner


OneLiner("let mapleader='-'", "Set mapleader to something else if you like")

OneLiner("inoremap kj <ESC>", "Go to normal mode typing  kj in insert mode")

OneLiner("noremap <leader>ne :NERDTreeToggle<cr>", "Toggle NERDTree file structure easily")


OneLiner('set background=dark')
OneLiner('set omnifunc=syntaxcomplete#Complete', "Autocompletion from vim" )
OneLiner('set number', "Numbering of lines")
OneLiner('set nocompatible', "No compatibility with vi")
OneLiner('filetype off')
OneLiner('filetype plugin on')
