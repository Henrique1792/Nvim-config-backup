local keymap = vim.keymap
local opt = vim.opt

-- trying kindly to remove verbosing
function Map(mode, sequence, command, params)
	keymap.set(mode, sequence, command, params)
end

--Required packages
--lspconfig and lspinstall
local comment = require('Comment')
local lspconfig = require('lspconfig')

local mason = require('mason')
mason.setup()

local masonlspconfig = require('mason-lspconfig')
masonlspconfig.setup({
	ensure_installed = { "html", "pyright", "gopls", "sumneko_lua", "clangd", "bashls" },
})


masonlspconfig.setup_handlers({
function (server_name) -- default handler (optional)
	lspconfig[server_name].setup{}
end,
})




-- lspsaga and cmp
local cmp = require('cmp')

--saga
local saga = require('lspsaga')

saga.init_lsp_saga({
	diagnostic_header = {
		'✗',
		'Ⅺ',
		'ツ',
		'Δ',
	}
})

-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back

Map("n", "<leader>gf", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

-- Code action
Map({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })

-- Mass rename
Map("n", "<localleader>gr", "<cmd>Lspsaga rename<CR>", { silent = true })

-- Peek Definition
-- you can edit the definition file in this flaotwindow
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back
Map("n", "<leader>Pd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

-- Show line diagnostics
Map("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

-- Show cursor diagnostic
Map("n", "<leader>sd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })

-- Diagnsotic jump can use `<c-o>` to jump back
Map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
Map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

-- Only jump to error
Map("n", "[E", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
Map("n", "]E", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })

-- Outline
Map("n","<leader>o", "<cmd>LSoutlineToggle<CR>",{ silent = true })

-- Hover Doc
Map("n", "<leader>K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

-- Float terminal
Map("n", "<leader><A-t>", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
-- if you want pass somc cli command into terminal you can do like this
-- open tig in lspsaga float terminal
-- Map("n", "<localleader>t", "<cmd>Lspsaga open_floaterm tig<CR>", { silent = true })
-- close floaterm
Map("t", "<A-q>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })


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
	completion ={
		keyword_length = 1,
	},
	formatting = {
		format = function(entry, vim_item)
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

-- comment
comment.setup()


-- Saga setup
opt.completeopt = { 'menuone', 'noinsert', 'noselect' }
