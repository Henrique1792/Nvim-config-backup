local keymap = vim.keymap
local opt = vim.opt

-- trying kindly to remove verbosing
function Map(mode, sequence, command, params)
	keymap.set(mode, sequence, command, params)
end

--Required packages
--lspconfig and lspinstall
local comment = require('Comment')

local mason = require('mason')
mason.setup()

local masonlspconfig = require('mason-lspconfig')
masonlspconfig.setup({
	ensure_installed = { "gopls", "sumneko_lua", "clangd", "bashls" },
})
masonlspconfig.setup_handlers({
	function(server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup {}
	end,

})
-- lspsaga and cmp
local cmp = require('cmp')
local navigator = require('navigator')
navigator.setup({
	mason = true,
	icons = {
		icons = false,
	},
	lsp = {
		disable_lsp = 'all',
	},
	keymaps = {
		{ key = '<localleader>gd', func = require('navigator.definition').definition, desc = 'definition' },
		{ key = '<localleader>gD', func = vim.lsp.buf.declaration, desc = 'declaration' },
		{ key = '<localleader>gp', func = require('navigator.definition').definition_preview, desc = 'definition_preview' },
		{ key = '<localleader>ca', mode = 'n', func = require('navigator.codeAction').code_action, desc = 'code_action' },
		{ key = '<localleader>k', func = require('navigator.dochighlight').hi_symbol, desc = 'hi_symbol' },
		{ key = ']e', func = vim.diagnostic.goto_next, desc = 'next diagnostics' },
		{ key = '[e', func = vim.diagnostic.goto_prev, desc = 'prev diagnostics' },

	},

})


-- tree-sitter
require 'nvim-treesitter.configs'.setup {
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
		enable = true,
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
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
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

-- comment
comment.setup()


-- Saga setup
opt.completeopt = { 'menuone', 'noinsert', 'noselect' }
