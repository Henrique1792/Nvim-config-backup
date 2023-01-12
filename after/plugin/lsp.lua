
-- trying kindly to remove verbosing
function Map(mode, sequence, command, params)
	vim.keymap.set(mode, sequence, command, params)
end



local lsp = require('lsp-zero')
local cmp = require('cmp')
local saga = require('lspsaga')

lsp.preset('recommended')


lsp.ensure_installed({
	'tsserver',
	'sumneko_lua',
	'gopls',
	'pyright',
	'clangd',
	'bashls'
})


-- cmp setup
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_completion = {
		keyword_length = 1,
	}
local cmp_mappings = {
		['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
}



lsp.setup_nvim_cmp({
	select=cmp_select,
	mapping=cmp_mappings,
	completion=cmp_completion
})


--lspsaga
saga.init_lsp_saga({
	diagnostic_header = {
		'✗',
		'ѫ',
		'ツ',
		'Δ',
	},
	code_action_icon="ㄣ",
	move_in_saga = {
		prev = "<C-p>",
		next="<C-n>"
	},
})

local opts = {remap=false, silent=true}
Map("n", "<leader>gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
-- Code action
Map({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
-- Mass rename
Map("n", "<localleader>gr", "<cmd>Lspsaga rename<CR>", opts)
-- Peek Definition
Map("n", "<leader>gd", "<cmd>Lspsaga peek_definition<CR>", opts)

-- Show line diagnostics
Map("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)

-- Show cursor diagnostic
Map("n", "<leader>sd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)

-- Diagnsotic jump can use `<c-o>` to jump back
Map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
Map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)

-- Only jump to error
Map("n", "[E", function()
	require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
	end, opts)
Map("n", "]E", function()
	require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
	end, opts)

-- Outline
Map("n","<leader>o", "<cmd>LSoutlineToggle<CR>",opts)

-- Hover Doc
Map("n", "<leader>K", "<cmd>Lspsaga hover_doc<CR>", opts)

-- lsp.on_attach(function(client, bufnr)
--
-- end)


lsp.setup()
