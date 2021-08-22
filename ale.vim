" ale
let g:ale_sign_error = '∅'
let g:ale_sign_warning = 'Δ'
"let g:ale_open_list = 1
set omnifunc=ale#completion#OmniFunc
let g:ale_list_window_size = 5
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
let g:airline#extensions#ale#enabled = 1


"linters

let g:ale_linters = {
\	'bash': ['bashate'],
\	'golang': ['golangci-lint'],
\	'c': ['clang'],
\	'javascript': ['flow'],
\	'markdown': ['pandoc'],
\	'python': ['bandit'],
\}

"fixers
