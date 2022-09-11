vim.cmd("colorscheme gruvbox")
local lualine=require('lualine')

lualine.setup {
    options = { theme = 'gruvbox' },

    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = { {'buffers', mode = 2}, 'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
  },

}

