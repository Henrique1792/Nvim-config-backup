"Plugins
call plug#begin('~/.local/share/nvim/plugged')

	Plug 'sheerun/vim-polyglot'
	Plug 'rafi/awesome-vim-colorschemes'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-surround'
	Plug 'ludovicchabant/vim-gutentags'
	Plug 'flazz/vim-colorschemes'
	if has('nvim') || has('patch-8.0.902')
		Plug 'mhinz/vim-signify'
	else
		Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
	endif
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

	"ale 
	Plug 'dense-analysis/ale'
	
	"airline
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'ryanoasis/vim-devicons'
	Plug 'Yggdroot/indentLine'

	"markdown note support
	Plug 'shime/vim-livedown'
	Plug 'vimwiki/vimwiki'

	"deoplete requisites
	  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
 
	"deoplete values
	Plug 'Shougo/deoplete-clangx'
	Plug 'Shougo/neco-vim'

	"undoTree
	Plug 'simnalamburt/vim-mundo'
	"Comments
	Plug 'tpope/vim-commentary'
	"LineDiff
	Plug 'AndrewRadev/linediff.vim'
	Plug 'vuciv/vim-bujo'
call plug#end()

"colorscheme - uncomment for choosing your favorite one
"colo zenburn
colo nord
"colo ayu
"colo wolfpack
"colo vydark
"colo monokai-chris

"signify
let g:signify_sign_add = "▶"
let g:signify_sign_delete = "✗"
let g:signify_sign_show_count = 0
let g:signify_sign_change = "⚠"

" ale
let g:ale_sign_error = '∅'
let g:ale_sign_warning = 'Δ'
"let g:ale_open_list = 1
set omnifunc=ale#completion#OmniFunc
let g:ale_list_window_size = 5
let g:ale_completion_enabled = 1



"airline
let g:webdevicons_enable_airline_statusline = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='owo'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#fzf#enabled = 1
let g:airline#extensions#gutentags#enabled = 1
let g:airline#extensions#whitespace#enabled = 0

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = '⎇ '
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = '〃'
let g:airline_symbols.colnr = 'Ф'

"indentLine
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_showFirstIndentLevel = 1

"fzf
let g:fzf_layout = { 'down': '15%' }

"deoplete
let g:deoplete#enable_at_startup = 1

"gutentags
" config project root markers.
let g:gutentags_project_root = ['.root']

" generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_cache_dir = expand('~/.cache/tags')





"markdown content
"we're adding dummy content here (precisely how to build up
"new wiki's if you need it. Have fun!

"let personal_wiki = {}
"let personal_wiki.path = '~/vimwiki/'
"let personal_wiki.syntax = 'markdown'
"let personal_wiki.ext = 'md'
"let g:vimwiki_list = [personal_wiki]


"bujo
"same as markdown approach - setting dummy path

"nmap <silent>bj :Todo g<CR>
"nmap <C-S> <Plug>BujoAddnormal
"imap <C-S> <Plug>BujoAddinsert
"nmap <C-Q> <Plug>BujoChecknormal
"imap <C-Q> <Plug>BujoCheckinsert

"let g:bujo#todo_file_path = '~'
"let g:bujo#window_width = 50 