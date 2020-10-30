noremap <silent><leader>ev :vsplit $MYVIMRC<CR>
noremap <silent><leader>sv :so $MYVIMRC<CR>

noremap <silent><leader>bn <ESC>:bn<CR>
noremap <silent><leader>bp <ESC>:bp<CR>
noremap <silent><leader>bd <ESC>:bd<CR>

vnoremap <silent><leader>y "*ygv"+y
noremap	 <silent><leader>p "+p

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif

nmap <silent><F2>  :tabnew<CR>
nmap <silent><F4>  :tabclose<CR>
nmap <silent><leader>q  :<C-W>q<CR>
nmap <silent><F3>  <ESC>:noh<CR>

nmap <silent><leader>\| :vsplit<CR><C-[><C-W>l
nmap <silent><leader>- :split<CR><C-[><C-W>j

nmap <silent><leader>h <C-W>h
nmap <silent><leader>j <C-W>j
nmap <silent><leader>k <C-W>k
nmap <silent><leader>l <C-W>l

nmap <silent><Left> <C-W><
nmap <silent><Down> <C-W>-
nmap <silent><Up>   <C-W>+
nmap <silent><Right> <C-W>>


command! WipeReg for i in range(34,255) | silent call setreg(nr2char(i), []) | endfor
nmap <silent><leader><F7> :let @+=expand("%")<CR>
nmap <silent><leader><F8> :let @+=expand("%:p")<CR>


noremap Zz <c-w>_ \| <c-w>\|
noremap Zo <c-w>=
noremap <leader>f <ESC>:Files<CR>


"fugitive
nnoremap <silent><F5> <ESC>:Gvdiffsplit<CR>
nnoremap <silent><F6> <ESC>:only<CR><ESC>:SignifyEnable<CR>
nnoremap <silent>gh :diffget //3
nnoremap <silent>gf :diffget //2

"markdown preview command

nmap <leader>gm :LivedownToggle<CR>
noremap <leader>t :Buffers<CR>
nnoremap <leader>u :UndotreeShow<CR>