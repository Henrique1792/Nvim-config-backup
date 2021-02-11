noremap <silent><leader>ev :vsplit $MYVIMRC<CR>
noremap <silent><leader>sv :so $MYVIMRC<CR>

noremap <silent><leader>bn <ESC>:bn<CR>
noremap <silent><leader>bp <ESC>:bp<CR>
noremap <silent><leader>bd <ESC>:bd<CR>
noremap <silent><leader>bw <ESC>:bw<CR>

vnoremap <silent><leader>y "*ygv"+y
noremap	 <silent><leader>p "+p

"function caps
nmap <silent><leader><F2>  :noh<CR>
nmap <silent><leader><F3>  :tabnew<CR>
nmap <silent><leader><F4>  :tabclose<CR>
nmap <silent><leader><F5>  :Gvdiffsplit!<CR>
nmap <silent><leader><F6>  :only<CR><ESC>:SignifyEnable<CR>
nmap <silent><leader><F7>  :let @+=expand("%")<CR>
nmap <silent><leader><F8>  :let @+=expand("%:p")<CR>
nmap <silent><leader><F9>  :BCommits<CR>
nmap <silent><leader><F10> :let @+=getreg('"')<CR> :let @*=getreg('"')<CR>


nmap <silent><leader>q  :<C-W>q<CR>

nmap <silent><leader>\| :vsplit<CR><C-[><C-W>l
nmap <silent><leader>- :split<CR><C-[><C-W>j

nmap <silent><leader>h <C-W>h
nmap <silent><leader>j <C-W>j
nmap <silent><leader>k <C-W>k
nmap <silent><leader>l <C-W>l

nmap <silent><leader><Left> <C-W><
nmap <silent><leader><Down> <C-W>-
nmap <silent><leader><Up>   <C-W>+
nmap <silent><leader><Right> <C-W>>


command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor


noremap Zz <c-w>_ \| <c-w>\|
noremap Zo <c-w>=


"fzf
noremap <leader>f <ESC>:Files<CR>
nmap <leader>/ :BLines<CR>
nmap <leader>? :Rg<CR>
nmap <S-q> :Buffers<CR>


"fugitive
nnoremap <silent><leader>gh :diffget //3<CR>
nnoremap <silent><leader>gf :diffget //2<CR>

"markdown preview command
nmap <leader>gm :LivedownToggle<CR>


"undotree
nnoremap <leader>u :UndotreeShow<CR>

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif