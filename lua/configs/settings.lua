-- Settings file!
--
-- set things as opt
-- let things as g

local opt = vim.opt
local g = vim.g

local home = os.getenv("HOME")


-- general
-- number and relative number
opt.number = true
opt.relativenumber = true

-- scroll window offset
opt.scrolloff = 3

-- etcs
opt.bg = "dark"
opt.cc = '80'
opt.encoding = "utf-8"
opt.fixendofline = false
opt.guicursor = "n-v-c-sm-i-ci-ve:block"
opt.langmenu = "en_US.UTF-8"
vim.cmd('language messages en_US.UTF-8')
opt.updatetime = 100
opt.shortmess.append = "Ic"
vim.cmd('filetype indent plugin on')
-- syntax
vim.cmd("syntax on")

-- cursor behavior
opt.cursorcolumn = true
opt.cursorline = true

--leader and localleader
g.mapleader = ' '
g.maplocalleader = '  '

-- undofile
opt.undofile = true
opt.undodir = home .. "/.vim/undo"

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

-- search behavior
opt.hlsearch = true
opt.incsearch = true

--python path
g.python3_host_prog = home .. "/.pyenv/shims/python3"
g.python_host_prog = home .. "/.pyenv/shims/python2.7"
