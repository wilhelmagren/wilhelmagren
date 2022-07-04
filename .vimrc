" Vim configuration file. "
" Please see my personal github page /willeagren/
" for more dot- and configuration files!

" enable mouse support "
set mouse=a

" enable syntax "
syntax on

" enable line numbers "
set number

" highlight current line "
set cursorline
:highlight CursorLine cterm=bold ctermbg=black

" enable highlight search pattern "
set hlsearch

" enable smartcase search sensitivity "
set ignorecase
set smartcase

" Indentation using spaces. "
" tabstop:	width of tab character
" softtabstop:	fine tunes the amount of whitespace to be added
" shiftwidth:	determines the amount of whitespace to add in 
" 		normal mode, i.e. not VISUAL or INSERT
" expandtab:	use spaces instead of tabs when set
" textwidth:	max text width before wrap
" autoindent:	autoindent the next new line
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set textwidth=79
set autoindent

" show the matching part of parentheses pairs (), {} and () "
set showmatch

" remap the split (:sp) navigation to not require C-W beforehand "
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" enable folding of functions/methods/classes... 
" also remap folding with spacebar instead of (za)
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Enable correct terminal colors. "
if !has('gui_running')
    set t_Co=256
endif
set termguicolors

" Setup and install vim-plug. "
"
" 	link: 	https://github.com/junegunn/vim-plug
"	unix: 	`curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
"
"	then go into Vim and type `:PlugInstall` to finalize setup,
"   add any plugins that you want below.
" 
call plug#begin('~/.vim/plugged')

call plug#end()
