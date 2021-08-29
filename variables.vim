"set stuff
syntax on
set nu rnu
set noswapfile
set inccommand=split
set wildoptions+=pum
set cursorcolumn cursorline

set undofile
set undodir=~/.vim/undo

filetype indent plugin on
set hidden autoindent modeline showcmd 
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o
set ts=4 softtabstop=4 et sw=4 
set bg=dark
set foldmethod=indent
set foldlevel=99
set smartcase
set backspace=indent,eol,start
set shortmess+=Ic
set encoding=UTF-8
set mouse=""
set list 
set lcs=tab:\|\ 
set updatetime=100
set scrolloff=3
set noeol nofixendofline
set noexpandtab 
set cc=80
"hi Normal guibg=NONE ctermbg=NONE

if (has("termguicolors"))
  set termguicolors
endif

"let stuff
let mapleader = "\<Space>"
let g:netrw_liststyle = 3
let g:netrw_winsize = 25

set langmenu=en_US.UTF-8
language messages en_US.UTF-8
set gcr= "n-v-c-sm-i-ci-ve:block"
         
let g:python3_host_prog="$HOME/.pyenv/shims/python3"
let g:python_host_prog="$HOME/.pyenv/shims/python2.7"