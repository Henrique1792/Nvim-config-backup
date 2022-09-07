-- keymaps
local keymap = vim.keymap

function Map(Mode, sequence, command, params)
	keymap.set{Mode, sequence, command, params}
end



Map('n','<leader>ev',':vsplit $MYVIMRC<CR>',{noremap=true, silent=true})
Map('n','<leader>sv',':so $MYVIMRC<CR>',{noremap=true, silent=true})

Map('n','<localleader>i','<C-[>:bn<CR>',{noremap=true, silent=true})
Map('n','<localleader>o','<C-[>:bp<CR>',{noremap=true, silent=true})
Map('n','<localleader>d','<C-[>:bd<CR>',{noremap=true, silent=true})
Map('n','<localleader>W','<C-[>:bw!<CR>',{noremap=true, silent=true})
Map('n','<localleader>w','<C-[>:w<CR>',{noremap=true, silent=true})
Map('n','<leader>sv','',{noremap=true, silent=true})
Map('n','<leader>ev','',{noremap=true, silent=true})
Map('n','<leader>sv','',{noremap=true, silent=true})



Map('n','<F3>,':noh<CR>'<silent>  :noh<CR>)
Map('n','<F2>,':tabnew<CR>'<silent>  :tabnew<CR>)
Map('n','<F4>,':tabclose<CR>'<silent>  :tabclose<CR>)

-- Map('n','<F5>,':Gvdiffsplit!<CR>'<silent>  :Gvdiffsplit!<CR>)
-- Map('n','<F6>,':only!<CR><C-[>:SignifyEnable<CR>'<silent>  :only!<CR><C-[>:SignifyEnable<CR>)


Map('n','<F7>,''<silent>  :let @+=expand("%:p")<CR><C-[>:let @*=expand("%:p")<CR>)
Map('n','<F8>,''<silent>  :let @+=expand("%:p:h")<CR><C-[>:let @*=expand("%:p:h")<CR>)

