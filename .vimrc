"# enable correct colors
set term=xterm-256color

"# enable syntax coloring, and set line-numbering
"# set tabs to put 4 spaces in the input mode,
"# doing this to avoid potential issues when reading the
"# code in the web or in someone elses editor
"# This also follows the PIP 8 convention
syntax on
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set fileformat=unix

"# remap the split (:sp) navigation to not require C-W beforehand
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"# enable folding of functions/methods/classes, i.e. show only 
"# the definition of it instead of all the code
"# also remape folding with spacebar instead of (za)
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

"# set the colorscheme, se ~/.vim/colors/ for available colorschemes
"# autocmd vimenter * ++nested colorscheme gruvbox
"# set background=dark
"# let g:gruvbox_contrast_dark='medium'

call plug#begin('~/.vim/plugged')
"# Plug 'morhetz/gruvbox'

call plug#end()
