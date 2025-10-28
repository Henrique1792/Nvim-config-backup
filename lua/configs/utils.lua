-- utils

-- I believe this wasn't rly required, but it will ease settings file loc 
-- set things as opt
-- let things as g

local opt = vim.opt
local g = vim.g

-- scroll window offset
opt.scrolloff = 3

-- search behavior
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true


--linewrap
-- opt.wrap=false

-- clipboard behavior
-- opt.clipboard:append("unnamedplus")


-- file dependant configs
local home = os.getenv("HOME")

-- undofile
opt.undofile = true
opt.undodir = home .. "/.vim/undo"

--python path
g.python3_host_prog = home .. "/.pyenv/shims/python3"
g.python_host_prog = home .. "/.pyenv/shims/python2.7"
