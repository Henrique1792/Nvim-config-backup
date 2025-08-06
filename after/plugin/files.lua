local keymap = vim.keymap

-- trying kindly to remove verbosing
function Map(mode, sequence, command, params)
	keymap.set(mode, sequence, command, params)
end

-- 
local oil = require("oil")
oil.setup({
	default_file_explorer = true,
	columns = {
		"icon",
		"permissions",
		"size",
	},
})
Map('n','<localleader>f','<cmd>Oil<CR>',nil)

-- fzf
local fzf = require('fzf-lua')

fzf.setup {
	previewers = {
		man = {
			cmd = "man %s | col -bx",
		}
	}
}

local fzf_cmd_opts={noremap=true, silent=true}
Map('n','<leader>f',':FzfLua files<CR>',fzf_cmd_opts)
Map('n','<leader>?',':FzfLua live_grep<CR>',fzf_cmd_opts)
Map('n','<leader>/',':FzfLua lgrep_curbuf<CR>',fzf_cmd_opts)
Map('n','<S-q>',':FzfLua buffers<CR>',fzf_cmd_opts)
Map('n','<leader>M','<cmd>FzfLua marks<CR>',fzf_cmd_opts)
Map('n','<leader>J','<cmd>FzfLua jumps<CR>',fzf_cmd_opts)
Map('n','<F12>','<cmd>FzfLua man_pages<CR>',fzf_cmd_opts)
Map('n','<localleader>D','<cmd>FzfLua diagnostics_document<CR>',fzf_cmd_opts)

-- undotree
local undotree = require('undotree')
undotree.setup()
Map('n', '<leader>u', require('undotree').toggle, { noremap = true, silent = true })



-- harpoon

local harpoon = require('harpoon')
harpoon.setup()

Map("n", "<leader>a", function() harpoon:list():add() end)
Map("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

Map("n", "<leader>1", function() harpoon:list():select(1) end)
Map("n", "<leader>2", function() harpoon:list():select(2) end)
Map("n", "<leader>3", function() harpoon:list():select(3) end)
Map("n", "<leader>4", function() harpoon:list():select(4) end)

Map("n", "<localleader>p", function() harpoon:list():prev() end)
Map("n", "<localleader>n", function() harpoon:list():next() end)


-- watch file changes lazy stuff
vim.cmd('command! -bang WatchForChanges                  :call WatchForChanges(@%,  {\'toggle\': 1, \'autoread\': <bang>0})')
vim.cmd('command! -bang WatchForChangesWhileInThisBuffer :call WatchForChanges(@%,  {\'toggle\': 1, \'autoread\': <bang>0, \'while_in_this_buffer_only\': 1})')
vim.cmd('command! -bang WatchForChangesAllFile :call WatchForChanges(\'*\', {\'toggle\': 1, \'autoread\': <bang>0})')

