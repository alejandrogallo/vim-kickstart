set nocompatible
filetype off
set rtp+=/home/gallo/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'Shougo/neocomplete.vim'
Plugin 'ervandew/supertab'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'scrooloose/nerdcommenter'
" Track the engine.
Plugin 'SirVer/ultisnips'

 " Snippets are separated from the engine. Add this if you want them:
"Plugin 'Valloric/YouCompleteMe'
Plugin 'honza/vim-snippets'
Plugin 'mattn/emmet-vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'VundleVim/Vundle.vim'
" All of your Plugins must be added before the following line
call vundle#end()
"No compatibility with vi
set nocompatible

"Set mapleader to something else if you like
let mapleader='-'

"Go to normal mode typing  kj in insert mode
inoremap kj <ESC>

"Toggle NERDTree file structure easily
noremap <leader>ne :NERDTreeToggle<cr>

"Color Theme
set background=dark

"Autocompletion from vim
set omnifunc=syntaxcomplete#Complete

"Numbering of lines
set number

filetype plugin on

"Automatic indentation for plugins
filetype plugin indent on

syntax enable

"Remap emmet trigger jey ctrl + e
let g:user_emmet_leader_key='<C-e>'

"Save current buffer
nnoremap <leader>s :w<cr>

"Close vim without saving
nnoremap <leader>q :q<cr>

"/ is way too far away
nnoremap <leader>f /

"Highlight search as you type the searching word
set incsearch

"provide a graphical menu of all the matches you can cycle through in the command line
set wildmenu

"Change to next buffer
noremap <Tab> :bn<CR>

"Change to previous buffer
noremap <S-Tab> :bp<CR>

"AIRLINE SETTINGS
let g:airline#extensions#tabline#enabled = 1

let g:Powerline_symbols = 'fancy'

"ULTISNIPS CONFIGURATION
let g:UltiSnipsExpandTrigger="<C-j>"

let g:UltiSnipsJumpForwardTrigger="<C-j>"

let g:UltiSnipsJumpBackwardTrigger="<c-k>"

let g:UltiSnipsListSnippets="<c-l>"

let g:UltiSnipsEditSplit="vertical"

"Set tabstop to tell vim how many columns a tab counts for
set tabstop=2

"When expandtab is set, hitting Tab in insert mode will produce the appropriate number of spaces.
set expandtab

"Set shiftwidth to control how many columns text is indented with the reindent operations (<< and >>)
set shiftwidth=2

"Set softtabstop to control how many columns vim uses when you hit Tab in insert mode
set softtabstop=2

"Set tab to 4
:nmap \t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>

"Set tab to 8 with insertmode tab to 4
:nmap \T :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>

"Some other common configuration
:nmap \M :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>

"Set tab to 2
:nmap \m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>
