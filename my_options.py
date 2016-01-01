
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
OneLiner('syntax enable')
OneLiner("let g:user_emmet_leader_key='<C-e>'", "Remap emmet trigger jey ctrl + e")

OneLiner("nnoremap <leader>s :w<cr>", "Save current buffer")
OneLiner("set incsearch", "Highlight search as you type the searching word")
