local keymap = vim.keymap

-- trying kindly to remove verbosing
function Map(mode, sequence, command, params)
	keymap.set(mode, sequence, command, params)
end

-- nnn
vim.cmd('let g:nnn#layout = { \'left\': \'~20%\' }')

-- fzf
Map('n','<leader>f',':FzfLua files<CR>',{noremap=true, silent=true})
Map('n','<leader>?',':FzfLua live_grep<CR>',{noremap=true, silent=true})
Map('n','<leader>/',':FzfLua grep_curbuf<CR>',{noremap=true, silent=true})
Map('n','<S-q>',':FzfLua buffers<CR>',{noremap=true, silent=true})
Map('n','<leader>m','<cmd>FzfLua marks<CR>',{noremap=true, silent=true})


-- undotree
require('undotree').setup()
Map('n', '<leader>u', require('undotree').toggle, { noremap = true, silent = true })




-- watch file changes lazy stuff
vim.cmd('command! -bang WatchForChanges                  :call WatchForChanges(@%,  {\'toggle\': 1, \'autoread\': <bang>0})')
vim.cmd('command! -bang WatchForChangesWhileInThisBuffer :call WatchForChanges(@%,  {\'toggle\': 1, \'autoread\': <bang>0, \'while_in_this_buffer_only\': 1})')
vim.cmd('command! -bang WatchForChangesAllFile :call WatchForChanges(\'*\', {\'toggle\': 1, \'autoread\': <bang>0})')

