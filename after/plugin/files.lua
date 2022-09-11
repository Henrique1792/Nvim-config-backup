local keymap = vim.keymap

-- trying kindly to remove verbosing
function Map(mode, sequence, command, params)
	keymap.set(mode, sequence, command, params)
end


-- fzf
vim.g.fzf_layout={down='15%'}
Map('n','<leader>',':Files<CR>',{noremap=true, silent=true})
