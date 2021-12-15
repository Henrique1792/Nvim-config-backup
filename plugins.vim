"Plugins
call plug#begin('~/.local/share/nvim/plugged')

	Plug 'flazz/vim-colorschemes'
	Plug 'rafi/awesome-vim-colorschemes'
	Plug 'machakann/vim-sandwich'

	"tpope block
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-eunuch'

	"signify
	if has('nvim') || has('patch-8.0.902')
		Plug 'mhinz/vim-signify'
	else
		Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
	endif
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

	
	"airline
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'ryanoasis/vim-devicons'
	Plug 'Yggdroot/indentLine'


	"undoTree
	Plug 'simnalamburt/vim-mundo'
	"Comments
	Plug 'numToStr/Comment.nvim'
	"LineDiff
	Plug 'AndrewRadev/linediff.vim'


	"Note taking
	Plug 'junegunn/goyo.vim'
	Plug 'junegunn/limelight.vim'
	Plug 'vuciv/vim-bujo'
	"markdown note support
	Plug 'shime/vim-livedown'
	Plug 'vimwiki/vimwiki'

	"color matching chars
	Plug 'p00f/nvim-ts-rainbow'


	"nnn file management
	Plug 'mcchrish/nnn.vim'

	"lsp
	Plug 'neovim/nvim-lspconfig'
	Plug 'williamboman/nvim-lsp-installer'
	Plug 'tami5/lspsaga.nvim'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-vsnip'
	Plug 'hrsh7th/vim-vsnip'

	"tags 
	Plug 'ludovicchabant/vim-gutentags'

	"tree-sitter
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

colo snow

"signify
let g:signify_sign_add = "▶"
let g:signify_sign_delete = "✗"
let g:signify_sign_show_count = 0
let g:signify_sign_change = "⚠"



"Limelight and Goyo
nmap <silent><localleader>W :Goyo<CR>:Limelight!!<CR>:SignifyToggle<CR>
let g:goyo_width=160
let g:goyo_height=100

"airline
let g:webdevicons_enable_airline_statusline = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='snow_dark'
let g:airline#extensions#gutentags#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#overflow_marker = 'Σ'
let g:airline#extensions#fzf#enabled = 1


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


"nnn
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }

"rainbow
let g:rainbow_active = 1

"gutentags 
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['.git']
let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')
command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')

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

"rainbow
let g:rainbow_active = 1
"wipe register
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
