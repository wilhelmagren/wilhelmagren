"# enable correct colors
set term=xterm-256color

"# enable syntax coloring
syntax on

"# set the colorscheme, se ~/.vim/colors/ for available colorschemes
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark='medium'

"# set numbering of lines
set nu

"# set plug(s)
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'

call plug#end()
