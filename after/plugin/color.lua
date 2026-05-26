-- general color settings

local opt = vim.opt


vim.cmd("set background=dark")
vim.cmd("colorscheme kanagawa-dragon")
opt.termguicolors=true


-- cursor behavior
opt.cursorcolumn = true
opt.cursorline = true


-- highlight colors at linenr

-- Set the current line number to white
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#FFFFFF', bold = true })

-- Set numbers above the cursor to purple
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#7805ad' })

-- Set numbers below the cursor to light blue
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#669ffa' })

-- General fallback for all line numbers if Above/Below aren't used
vim.api.nvim_set_hl(0, 'LineNr', { fg = '#5C6370' })


opt.cc="80"
vim.cmd("syntax on")
opt.autoindent=true
opt.signcolumn="yes"
vim.cmd('filetype indent plugin on')
opt.guicursor = "n-v-c-sm-i-ci-ve:block"
