lua << EOF
--Required packages
local lsp_install = require'lspinstall'
local saga = require 'lspsaga'


-- setup packages
lsp_install.setup()

-- functions

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end  

  -- Mappings.
  local opts = { noremap=true, silent=true }  
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n','gi','<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)


  --...

-- setup completion
  require'completion'.on_attach(client, bufnr)

end


local servers = lsp_install.installed_servers()
for _, server in pairs(servers) do
  require'lspconfig'[server].setup{
	  on_attach = on_attach
  }
end

-- saga configuration
saga.init_lsp_saga {
  error_sign = '✗',
  warn_sign = '▶',
  hint_sign = 'ㄔ',
  infor_sign = 'Δ',
  border_style = "round",
}


-- tree-sitter

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "python",
    "c",
    "go",
    "gomod",
    "bash",
    "cpp",
  },
}

-- rainbow
require'nvim-treesitter.configs'.setup {
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    colors = {}, -- table of hex strings
    termcolors = {} -- table of colour name strings
  }
}

EOF






" lua content
set completeopt=menuone,noinsert,noselect
nnoremap <silent><localleader>k :Lspsaga hover_doc<CR>
nnoremap <silent><localleader>gs :Lspsaga signature_help<CR>
nnoremap <silent><leader>gd :Lspsaga preview_definition<CR>