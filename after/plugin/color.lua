vim.cmd("colorscheme gruvbox")

--lualine
local lualine=require('lualine')
lualine.setup {
    options = { theme = 'gruvbox_dark' },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
  },

}

-- ts-rainbow
require("nvim-treesitter.configs").setup{}
