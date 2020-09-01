"Plugins
call plug#begin('~/.local/share/nvim/plugged')
	Plug 'sheerun/vim-polyglot'
	Plug 'rafi/awesome-vim-colorschemes'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-surround'
	"Plug 'vim-syntastic/syntastic'
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
call plug#end()

"colorscheme
colo wolfpack

"signify
let g:signify_sign_add = "▶"
let g:signify_sign_delete = "✗"
let g:signify_sign_show_count = 0
let g:signify_sign_change = "⚠"
nmap <silent><F5> <ESC>:SignifyDiff<CR>
nmap <silent><F6> <ESC>:tabclose<CR><ESC>:SignifyEnable<CR>


" ale
let g:ale_sign_error = '∅'
let g:ale_sign_warning = 'Δ'
let g:ale_open_list = 1
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc
let g:ale_completion_tsserver_autoimport = 1
let g:ale_list_window_size = 5


"airline
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:webdevicons_enable_airline_statusline = 1
let g:airline_theme='understated'
let g:airline#extensions#tabline#buffer_nr_show = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
"let g:airline_section_z = '%3p %l:%c'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = '⎇ '
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ' Φ'

"indentLine
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_showFirstIndentLevel = 1

"markdown content
nmap gm :LivedownToggle<CR>
let g:vimwiki_list = [{'path': '~/vimwiki/',
					  \ 'syntax': 'markdown', 'ext': '.md'}]