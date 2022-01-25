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
noremap <silent><localleader>W <C-[>:w<CR>

" // We'll get from vim and send it to system clipboard
" So we'll \pick\ y <leader>y to copy to clipboard!!! (Yeah, just like  guitar bro"
nnoremap <silent><leader>y :let @+=getreg('"')<CR><C-[>:let @*=getreg('"')<CR>
" // Same for pasting! Yet the sequence is inverted - attention! '+' register
" pastes into q
nnoremap <silent><leader>p :let @"=getreg('*')<CR><C-[>:let @q=getreg('+')<CR>




nmap <silent><F3>  :noh<CR>
nmap <silent><F2>  :tabnew<CR>
nmap <silent><F4>  :tabclose<CR>
nmap <silent><F5>  :Gvdiffsplit!<CR>
nmap <silent><F6>  :only!<CR><C-[>:SignifyEnable<CR>
nmap <silent><F7>  :let @+=expand("%:p")<CR><C-[>:let @*=expand("%:p")<CR>
nmap <silent><F8>  :let @+=expand("%:p:h")<CR><C-[>:let @*=expand("%:p:h")<CR>
nmap <silent><F9>  :Telescope git_commits<CR>

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

"loclist navigation
"nmap <silent><leader>o :lopen 5<CR><C-[><C-W>k
"nmap <silent><leader>c :lclose<CR>
"
"nmap <silent><Left>   :lprev<CR>
"nmap <silent><Right>  :lnext<CR>
"nmap <silent><Up>     :lfirst<CR>
"nmap <silent><Down>   :llast<CR>

noremap <leader>z <C-W>_ \| <c-w>\|
noremap <leader><S-z> <C-W>=


"fzf - backup
noremap <leader>f <C-[>:Files<CR>
nmap <leader>/ :BLines<CR>
nmap <leader>? :Rg<CR>
nmap <S-q> :Buffers<CR>
nmap <silent><F9>  :BCommits<CR>


"fugitive
nnoremap <silent><leader>gh :diffget //3<CR>
nnoremap <silent><leader>gf :diffget //2<CR>

"markdown preview command
nmap <localleader>gm :LivedownToggle<CR>


"Mundo undo tree
nnoremap <leader>u :MundoToggle<CR>



"Toggle mapping
let s:mappingsState=1
command! TM call ToggleMappings()
function! ToggleMappings()
    if s:mappingsState
		nmap J :m+1<CR>
		nmap K :m-2<CR>
    else
        unmap J
        unmap K
    endif
    let s:mappingsState = !s:mappingsState
endfunction

nmap <silent><localleader><S-x> :TM<CR>