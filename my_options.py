
from options import OneLiner, ManyOneLiners


OneLiner('set nocompatible', "No compatibility with vi")
OneLiner("let mapleader='-'", "Set mapleader to something else if you like")

OneLiner("inoremap kj <ESC>", "Go to normal mode typing  kj in insert mode")

OneLiner("noremap <leader>ne :NERDTreeToggle<cr>", "Toggle NERDTree file structure easily")


OneLiner('set background=dark', "Color Theme")
OneLiner('set omnifunc=syntaxcomplete#Complete', "Autocompletion from vim" )
OneLiner('set number', "Numbering of lines")
OneLiner('filetype off')
OneLiner('filetype plugin on')
OneLiner('filetype plugin indent on', "Automatic indentation for plugins")
OneLiner('syntax enable')
OneLiner("let g:user_emmet_leader_key='<C-e>'", "Remap emmet trigger jey ctrl + e")

OneLiner("nnoremap <leader>s :w<cr>", "Save current buffer")
OneLiner("nnoremap <leader>q :q<cr>", "Close vim without saving")
OneLiner("nnoremap <leader>f /", "/ is way too far away")
OneLiner("set incsearch", "Highlight search as you type the searching word")
# OneLiner(":nmap \t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>", "Set tab to 4")
# OneLiner(":nmap \T :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>", "Set tab to 4")
# OneLiner(":nmap \M :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>", "Set tab to 4")
# OneLiner(":nmap \m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>", "Set tab to 4")
OneLiner("set wildmenu", "provide a graphical menu of all the matches you can cycle through in the command line")
OneLiner("noremap <Tab> :bn<CR>","Change to next buffer") 
OneLiner("noremap <Tab-S> :bp<CR>","Change to previous buffer") 


######################
#  AIRLINE settings  #
######################

ManyOneLiners(["let g:airline#extensions#tabline#enabled = 1", "let g:Powerline_symbols = 'fancy'"], "AIRLINE SETTINGS")


###############
#  UltiSnips  #
###############

ManyOneLiners([
'let g:UltiSnipsExpandTrigger="<C-j>"',
'let g:UltiSnipsJumpForwardTrigger="<C-j>"',
'let g:UltiSnipsJumpBackwardTrigger="<c-p>"',
'let g:UltiSnipsListSnippets="<c-l>"',
'let g:UltiSnipsEditSplit="vertical"'], "ULTISNIPS CONFIGURATION")


