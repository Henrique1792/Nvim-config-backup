--maps speedup
local keymap = vim.keymap

-- trying kindly to remove verbosing
function Map(mode, sequence, command, params)
	keymap.set(mode, sequence, command, params)
end
--gitsigns
require('gitsigns').setup()

--git related maps
Map('n', '<F5>', ':Gvdiffsplit!<CR>',{noremap=true})
Map('n', '<F9>', ':FzfLua git_commits<CR>',{noremap=true})
Map('n', '<F12>', ':Git blame<CR>',{noremap=true})

