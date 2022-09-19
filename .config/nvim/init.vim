" Enable mouse support. "
" Enable syntax. "
" Enable line numbers. "
" Highlight current/cursor line. "
set mouse=a
syntax on
set number
set cursorline
:highlight CursorLine cterm=bold ctermbg=black

" Enable highlight search pattern. "
" Enable smartcase search sensitivity. "
set ignorecase
set smartcase

" Indentation using spaces. "
" tabstop:        width of tab character "
" sofftabstop:    fine tunes the amount of whitespace to be added "
" shiftwidth:     determine the amount of whitespace to add in "
"                 normal mode, i.e. not visual or insert "
" expandtab:      use spaces instead of tabs "
" textwidth:      max text width before wrapping the line "
" autoindent:     autoindent the next line if language expects it "
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set textwidth=90
set autoindent

" Show the matching part of parenthesis pair (), {} []. "
" Remap the split <:sp> navigation to not require C-w beforehand. "
set showmatch
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-L><C-L>

" Enable correct terminal colors. "
if !has('gui_running')
    set t_Co=256
endif
set termguicolors

" Vim-plug, a minimalist Vim plugin manager. "
call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Set colorscheme and related config. "
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark='soft'
let g:gruvbox_contrast_light='hard'
let g:airline_powerline_fonts=1
let g:airline_theme='gruvbox'
