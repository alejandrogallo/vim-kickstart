""""""""""""""""""""""
"  VUNDLE.VIM STUFF  "
""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/gnuplot.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'alejandrogallo/vasp.vim'
Plugin 'dhruvasagar/vim-table-mode'
if has("lua")
  " it needs lua!
  Plugin 'Shougo/neocomplete.vim'
endif
Plugin 'ervandew/supertab'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'scrooloose/nerdcommenter'
if v:version >= 704
  "it needs vim 7.04..
  Plugin 'SirVer/ultisnips'
endif
Plugin 'honza/vim-snippets'
Plugin 'mattn/emmet-vim'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
" Track the engine.
Plugin 'VundleVim/Vundle.vim'
" All of your Plugins must be added before the following line
call vundle#end()




"""""""""""""""""""
"  GENERAL STUFF  "
"""""""""""""""""""
"No compatibility with vi
set nocompatible

"Go to normal mode typing  kj in insert mode
inoremap kj <ESC>

" map : to - 
noremap - :

"Autocompletion from vim
set omnifunc=syntaxcomplete#Complete

"Numbering of lines
set number

" Relative numbering
if v:version >= 704
  "is only supported for vim 7.04 and above... 
  set relativenumber
endif

filetype plugin on

"Automatic indentation for plugins
filetype plugin indent on

"enable coloring and so on 
syntax enable

"Highlight search as you type the searching word
set incsearch

"provide a graphical menu of all the matches you can cycle through in the command line
set wildmenu

" Return to the line where the cursor was before the latest jump 
noremap <leader>r ``

" Marks for special characters
set listchars=eol:¬,trail:·
set listchars+=tab:>\ 
" Activate listchars
set list




""""""""""""""""""""""
"  LEADER key STUFF  "
""""""""""""""""""""""
"Set maplocalleader to something else if you like
let mapleader=';'

"Set maplocalleader to something else if you like
let maplocalleader=','

"Save current buffer
nnoremap <localleader>w :w<cr>

"Close vim without saving
nnoremap <localleader>q :q<cr>

"/ is way too far away
nnoremap <localleader>f /

" too complicated to replace
nnoremap <localleader>r :%s/

"Toggle NERDTree file structure easily
noremap <localleader>ne :NERDTreeToggle<cr>





""""""""""""""""""
"  Buffer stuff  "
""""""""""""""""""
"Change to next buffer
noremap <Tab> :bn<CR>

"Change to previous buffer
noremap <S-Tab> :bp<CR>

"Delete 
nnoremap <localleader>bd :bd<CR>




"""""""""""""
"  AIRLINE  "
"""""""""""""
let g:airline_powerline_fonts = 0

let g:Powerline_symbols = 'fancy'

let g:airline_theme = 'badwolf'

let g:airline#extensions#tabline#enabled = 1

" To get the downbar
set laststatus=2


"""""""""""""""""""""
"  ULTISNIPS STUFF  "
"""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<C-j>"

let g:UltiSnipsJumpForwardTrigger="<C-j>"

let g:UltiSnipsJumpBackwardTrigger="<c-k>"

let g:UltiSnipsListSnippets="<c-l>"

let g:UltiSnipsEditSplit="vertical"




"""""""""""""""""""""""
"  TAB CONFIGURATION  "
"""""""""""""""""""""""
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





"""""""""""""""
"  EMMET.VIM  "
"""""""""""""""
"Remap emmet trigger jey ctrl + e (CTRL+EMMET)
let g:user_emmet_leader_key='<C-e>'



"""""""""""""""""""""
"  NEOCOMPLETE.VIM  "
"""""""""""""""""""""
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_fuzzy_completion = 1




""""""""""""""""
"  TERM STUFF  "
""""""""""""""""
if &term ==# "xterm"
  " Sometimes when environment variable TERM is only set 
  " to xterm, I have problems with colors, so I try to 
  " force 256 colors and not only 8
  let &term = "xterm-256color"
endif


""""""""""""
"  Ctrl-p  "
""""""""""""
let g:ctrlp_map = '<c-p>' " This is the default
let g:ctrlp_cmd = 'CtrlP'

" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']



function! AppendUnicodeMath()
  let l:math = system("tex2unicode.in", getline("."))
  call append(".", l:math)
endfunction



""""""""""""""""""""
"  MOVING AROUNDK  "
""""""""""""""""""""
"go to the next parentheses
nnoremap gp /(<CR>
nnoremap gP ?(<CR>


"""""""""""""""
"  SYNTASTIC  "
"""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


""""""""""""""""
"  colortheme  "
""""""""""""""""
let g:solarized_termcolors=256
colorscheme solarized
let b:hour = strftime("%H")
if b:hour >= 9 && b:hour <=15
  set background=light
else
  set background=dark
endif
set background=dark


