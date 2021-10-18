lua << EOF
--Required packages
local lsp_install = require'lspinstall'
local saga = require 'lspsaga'
local cmp = require'cmp'
local servers = lsp_install.installed_servers()


-- setup packages
lsp_install.setup()

-- functions

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end  

  -- Mappings.
  local opts = { noremap=true, silent=true }  
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)

  --...

-- setup completion
  cmp.on_attach(client, bufnr)

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
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  highlight = {
    enable = true,
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

  -- Setup nvim-cmp.
  cmp.setup({
    snippet = {
      expand = function(args)
        -- For `vsnip` user.
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.
      end,
    },
    mapping = {
	  ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
	  ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
      { name = 'nvim_lsp' },
      -- For vsnip user.
      { name = 'vsnip' },
      { name = 'buffer' },
    }
  })
 -- Setup lspconfig.

for _, server in pairs(servers) do
  require'lspconfig'[server].setup {
	  {on_attach = on_attach}, 
	  {capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())}
  }
end

require'nvim-treesitter.configs'.setup {
}

EOF

" lua content
set completeopt=menuone,noinsert,noselect
nnoremap <silent><localleader>k :Lspsaga hover_doc<CR>

nnoremap <silent><localleader>gs :Lspsaga signature_help<CR>
nnoremap <silent><localleader>gd :Lspsaga preview_definition<CR>


nnoremap <silent><localleader>ca :Lspsaga code_action<CR>

nnoremap <silent> ]e :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> [e :Lspsaga diagnostic_jump_prev<CR>