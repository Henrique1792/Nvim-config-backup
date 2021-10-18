" normal maps... maybe it's time to consider new modes for mapping?
"
"function caps
"it contains Gvdiffsplit! from fugitive 
"and BCommits from fzf!
"- it violates maps intention of keeping only vim mappings here!
" another option is throw everything here

noremap <silent><leader>ev :vsplit $MYVIMRC<CR>
noremap <silent><leader>sv :so $MYVIMRC<CR>

noremap <silent><localleader>n <C-[>:bn<CR>
noremap <silent><localleader>p <C-[>:bp<CR>
noremap <silent><localleader>d <C-[>:bd<CR>
noremap <silent><localleader>w <C-[>:bw<CR>

" // We'll get from vim and send it to system clipboard
" So we'll \pick\ y <leader>y to copy to clipboard!!! (Yeah, just like  guitar bro"
nnoremap <silent><leader>y :let @+=getreg('"')<CR><C-[>:let @*=getreg('"')<CR>
" // Same for pasting! Yet the sequence is inverted :p
nnoremap <silent><leader>p :let @"=getreg('*')<CR><C-[>:let @1=getreg('+')<CR>




nmap <silent><F3>  :noh<CR>
nmap <silent><F2>  :tabnew<CR>
nmap <silent><F4>  :tabclose<CR>
nmap <silent><F5>  :Gvdiffsplit!<CR>
nmap <silent><F6>  :only!<CR><C-[>:SignifyEnable<CR>
nmap <silent><F7>  :let @+=expand("%:p")<CR><C-[>:let @*=expand("%:p")<CR>
nmap <silent><F8>  :let @+=expand("%:p:h")<CR><C-[>:let @*=expand("%:p:h")<CR>
nmap <silent><F9>  :BCommits<CR>

nmap <silent><leader><F10> <C-[>:Limelight!!<CR>
nmap <leader><F12> <C-[>:Git blame<CR>

nmap <silent><leader>q  :<C-W>q<CR>

nmap <silent><leader>\ :vsplit<CR><C-[><C-W>l
nmap <silent><leader>- :split<CR><C-[><C-W>j

nmap <silent><leader>h <C-W>h
nmap <silent><leader>j <C-W>j
nmap <silent><leader>k <C-W>k
nmap <silent><leader>l <C-W>l

nmap <silent><localleader><Left> <C-W><
nmap <silent><localleader><Down> <C-W>-
nmap <silent><localleader><Up>   <C-W>+
nmap <silent><localleader><Right> <C-W>>
nmap <silent><localleader>r <C-[>:reg<CR>

"nmap <silent><Left>   <C-[>:lprev<CR>
"nmap <silent><Right>  <C-[>:lnext<CR>
"nmap <silent><Up>     <C-[>:lfirst<CR>
"nmap <silent><Down>   <C-[>:llast<CR>
"
"nmap <silent><leader>o <C-[>:lopen 5<CR><C-[><C-W>k
"nmap <silent><leader>c <C-[>:lclose<CR>




noremap <leader>z <C-W>_ \| <c-w>\|
noremap <leader>= <C-W>=


"fzf
noremap <leader>f <C-[>:Files<CR>
nmap <leader>/ :BLines<CR>
nmap <leader>? :Rg<CR>
nmap <S-q> :Buffers<CR>


"fugitive
nnoremap <silent><leader>gh :diffget //3<CR>
nnoremap <silent><leader>gf :diffget //2<CR>

"markdown preview command
nmap <localleader>gm :LivedownToggle<CR>


"Mundo undo tree
nnoremap <leader>u :MundoToggle<CR>