local keymap = vim.keymap

-- trying kindly to remove verbosing
function Map(mode, sequence, command, params)
	keymap.set(mode, sequence, command, params)
end


-- fzf
Map('n','<leader>f',':FzfLua files<CR>',{noremap=true, silent=true})
Map('n','<leader>?',':FzfLua live_grep<CR>',{noremap=true, silent=true})
Map('n','<leader>/',':FzfLua grep_curbuf<CR>',{noremap=true, silent=true})
Map('n','<leader>Q',':FzfLua buffers<CR>',{noremap=true, silent=true})
