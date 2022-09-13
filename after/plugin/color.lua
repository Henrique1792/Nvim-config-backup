vim.cmd("colorscheme gruvbox")

--lualine
local lualine=require('lualine')
lualine.setup {
    options = { theme = 'ayu' },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {{'buffers',mode=4}},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress', 'location'},
        lualine_z = {'filename'}
  },

}

-- ts-rainbow
require("nvim-treesitter.configs").setup{}
