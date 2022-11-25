-- Settings file!

-- set things as opt
-- let things as g

local opt = vim.opt
local g = vim.g

-- general
-- number and relative number
opt.number = true
opt.relativenumber = true

-- etcs
opt.encoding = "utf-8"
opt.fixendofline = false
opt.langmenu = "en_US.UTF-8"
opt.updatetime = 100
opt.shortmess.append = "Ic"
vim.cmd('language en_US.UTF-8')

--leader and localleader
g.mapleader = ' '
g.maplocalleader = '  '


-- tabstops and shiftwidths
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 0
opt.expandtab = false
opt.smarttab = true

-- smartcase
opt.smartcase = true

-- list
opt.list = true
opt.listchars = { tab = '|⋅', trail = '␣', eol = '⋅' }

-- swapfile
opt.swapfile = false

-- backspace behavior
vim.cmd('set backspace=indent,eol,start')

-- wildignore
opt.wildignore = { '*.swp', '*.bak', '*.pyc', '*.class', '*.o' }
opt.wildoptions.append = 'pum'

-- foldmethod
opt.foldmethod = "indent"
opt.foldlevel = 99
