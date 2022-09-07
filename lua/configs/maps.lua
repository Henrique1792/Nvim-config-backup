-- keymaps
-- Writer sidenote - this mappings run just using vim structure
-- plugins have their own place for mapping and will be set
-- individually
--
--
-- e.g
--
-- Map('n','<F5>,':Gvdiffsplit!<CR>'<silent>  :Gvdiffsplit!<CR>)
-- Map('n','<F6>,':only!<CR><C-[>:SignifyEnable<CR>'<silent>  :only!<CR><C-[>:SignifyEnable<CR>)
-- will be transfered to plugin setup

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

-- We'll fix register behaviour later.
-- Map('n','<F7>',':let @+=expand("%:p")<CR><C-[>:let @*=expand("%:p")<CR>', {noremap=true, silent=true})
-- Map('n','<F8>',':let @+=expand("%:p:h")<CR><C-[>:let @*=expand("%:p:h")<CR>', {noremap=true, silent=true})

Map('n','<leader>q',':<C-W>q<CR>',{silent=true})
Map('n','<leader>\\',':vsplit<CR><C-[><C-W>l',{silent=true})
Map('n','<leader>-',':split<CR><C-[><C-W>j',{silent=true})

Map('n','<leader>h',':<C-W>h',{silent=true})
Map('n','<leader>j',':<C-W>j',{silent=true})
Map('n','<leader>k',':<C-W>k',{silent=true})
Map('n','<leader>l',':<C-W>l',{silent=true})


Map('n','<localleader><Left>',':<C-W><',{silent=true})
Map('n','<localleader><Down>',':<C-W>-',{silent=true})
Map('n','<localleader><Up>',':<C-W>+',{silent=true})
Map('n','<localleader><Right>',':<C-W>>',{silent=true})
Map('n','<localleader>r ','<C-[>:reg<CR>',{silent=true})

