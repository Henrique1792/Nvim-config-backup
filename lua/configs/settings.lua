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
opt.scrolloff=3

-- etcs
opt.background="dark"
opt.cc='80'
opt.encoding="utf-8"
opt.fixendofline = false
opt.guicursor="n-v-c-sm-i-ci-ve:block"
opt.langmenu="en_US.UTF-8"
opt.updatetime=100
opt.shortmess.append="Ic"

-- syntax
vim.cmd("syntax on")

-- cursor behavior
opt.cursorcolumn = true
opt.cursorline = true

--leader and localleader
g.leader=' '
g.localleader='  '

-- undofile
opt.undofile = true
opt.undodir = home.."/.vim/undo"

-- tabstops and shiftwidths
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 0
opt.expandtab = true
opt.smarttab = true

-- smartcase
opt.smartcase = true

-- list
opt.listchars = {tab='|⋅',trail='␣',eol='⋅'}
opt.list = true

-- swapfile
opt.swapfile = false

-- backspace behavior
opt.backspace={indent=true,eol=true,start=true}

-- wildignore
opt.wildignore = {'*.swp','*.bak','*.pyc','*.class','*.o'}

-- foldmethod
opt.foldmethod="indent"
opt.foldlevel=99


-- search behavior
opt.hlsearch = true
opt.incsearch = true

--python path
g.python3_host_prog=home .. "/.pyenv/shims/python3.9"
g.python_host_prog=home .. "/.pyenv/shims/python2.7"