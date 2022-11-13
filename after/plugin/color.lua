-- general color settings

local opt = vim.opt


vim.cmd("set background=dark")
vim.cmd('colorscheme tokyonight')
opt.termguicolors=true


-- cursor behavior
opt.cursorcolumn = true
opt.cursorline = true



opt.cc="80"
vim.cmd("syntax on")
opt.autoindent=true
opt.signcolumn="yes"
vim.cmd('filetype indent plugin on')
opt.guicursor = "n-v-c-sm-i-ci-ve:block"
