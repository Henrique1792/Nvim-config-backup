
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
local cmp = require('cmp')
local lspkind = require('lspkind')
cmp.setup({
	snippet = {
		expand = function(args)
			-- For `vsnip` user.
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.
		end,
	},
	completion ={
		keyword_length = 1,
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol', -- show only symbol annotations
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
			before = function(entry, vim_item)
				vim_item.menu = ({
					nvim_lsp = "[LSP]",
					spell = "[Spellings]",
					buffer = "[Buffer]",
					ultisnips = "[Snip]",
					treesitter = "[Treesitter]",
					calc = "[Calculator]",
					nvim_lua = "[Lua]",
					path = "[Path]",
					nvim_lsp_signature_help = "[Signature]",
					cmdline = "[Vim Command]"
				})[entry.source.name]
				return vim_item
			end,
		}),
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
	},
	{
		{ name = 'buffer' },
	},
})
