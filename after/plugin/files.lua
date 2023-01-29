local keymap = vim.keymap

-- trying kindly to remove verbosing
function Map(mode, sequence, command, params)
	keymap.set(mode, sequence, command, params)
end

-- nnn
vim.cmd('let g:nnn#layout = { \'left\': \'~20%\' }')

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


-- undotree
require('undotree').setup()
Map('n', '<leader>u', require('undotree').toggle, { noremap = true, silent = true })




-- watch file changes lazy stuff
vim.cmd('command! -bang WatchForChanges                  :call WatchForChanges(@%,  {\'toggle\': 1, \'autoread\': <bang>0})')
vim.cmd('command! -bang WatchForChangesWhileInThisBuffer :call WatchForChanges(@%,  {\'toggle\': 1, \'autoread\': <bang>0, \'while_in_this_buffer_only\': 1})')
vim.cmd('command! -bang WatchForChangesAllFile :call WatchForChanges(\'*\', {\'toggle\': 1, \'autoread\': <bang>0})')

