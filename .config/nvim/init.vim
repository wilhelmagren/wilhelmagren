"#
"# vertical line-numbers, autoindentation, tabstop to spaces and tab length, encoding
"#
set number
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set mouse=a
set encoding=UTF-8
set fileformat=unix

"#
"# vim-plug, plugin manager
"# https://github.com/junegunn/vim-plug
"#
"# Installation
"# ------------
"# Unix:
"#  sh -c curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"#  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"#
call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'ap/vim-css-color'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'ryanoasis/vim-devicons'
Plug 'tc50cal/vim-terminal'

call plug#end()

"#
"# color stuffs, 
"#
syntax on
colorscheme PaperColor

"#
"# keybindings
"#

"# set focus to NERDTree with ctrl+f
"# open NERDTree with ctrl+n
"# toggle NERDTree with ctrl+t
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

"# remap the split (:sp) navigation to not requires C-W beforehand
nnoremap <C-H> <C-W><C-W>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
set splitbelow
set splitright
