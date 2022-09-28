-- keymaps
-- Writer sidenote - this mappings run just using vim structure
-- plugins have their own place for mapping and will be set
-- individually

local keymap = vim.keymap

-- trying kindly to remove verbosing
function Map(mode, sequence, command, params)
	keymap.set(mode, sequence, command, params)
end

Map('n','<leader>ev',':vsplit $MYVIMRC<CR>',{noremap=true, silent=true})
Map('n','<leader>sv',':so $MYVIMRC<CR>',{noremap=true, silent=true})

Map('n','<localleader>i','<C-[>:bn<CR>',{noremap=true, silent=true})
Map('n','<localleader>o','<C-[>:bp<CR>',{noremap=true, silent=true})
Map('n','<localleader>d','<C-[>:bd<CR>',{noremap=true, silent=true})
Map('n','<localleader>W','<C-[>:bw!<CR>',{noremap=true, silent=true})
Map('n','<localleader>w','<C-[>:w<CR>',{noremap=true, silent=true})


Map('n','<F3>',':noh<CR>',{silent=true})
Map('n','<F2>',':tabnew<CR>',{silent=true})
Map('n','<F4>',':tabclose<CR>',{silent=true})
Map('n','<F6>',':only!<CR>',{noremap=true, silent=true})

Map('n','<leader>q',':<C-W>q<CR>',{silent=true})
Map('n','<leader>\\',':vsplit<CR><C-[><C-W>l',{silent=true})
Map('n','<leader>-',':split<CR><C-[><C-W>j',{silent=true})

Map('n','<leader>h','<C-W>h',{silent=true})
Map('n','<leader>j','<C-W>j',{silent=true})
Map('n','<leader>k','<C-W>k',{silent=true})
Map('n','<leader>l','<C-W>l',{silent=true})


Map('n','<localleader><Left>','<C-W><',{silent=true})
Map('n','<localleader><Down>','<C-W>-',{silent=true})
Map('n','<localleader><Up>','<C-W>+',{silent=true})
Map('n','<localleader><Right>','<C-W>>',{silent=true})
Map('n','<localleader>r','<C-[>:reg<CR>',{silent=true})

Map('n','<leader>z','<C-W>_ | <c-w>|',{silent=true, noremap=true})
Map('n','<leader>=','<C-W>=',{silent=true, noremap=true})

-- too lazy to set this properly - f* the police by now
vim.cmd('command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor')
vim.cmd('nnoremap <silent><leader>y :let @+=getreg(\'\"\')<CR><C-[>:let @*=getreg(\'\"\')<CR>:echo \"yank!\"<CR>')
vim.cmd('nnoremap <silent><leader>p :let @"=getreg(\'*\')<CR><C-[>:let @q=getreg(\'+\')<CR>:echo \"paste ready!\"<CR>')

-- toggle mapping setup for the following motions
vim.cmd('\
    let s:mappingsState=1\
    command! TM call ToggleMappings()\
    function! ToggleMappings()\
    if s:mappingsState\
        nmap J :m+1<CR>\
        nmap K :m-2<CR>\
    else\
        unmap J\
        unmap K\
        endif\
        let s:mappingsState = !s:mappingsState\
    endfunction\
\
        nmap <silent><localleader><S-x> :TM<CR>\
')
