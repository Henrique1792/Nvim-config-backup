-- trying kindly to remove verbosing
function Map(mode, sequence, command, params)
	vim.keymap.set(mode, sequence, command, params)
end



local lsp = require('lsp-zero')
local cmp = require('cmp')

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
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-p>'] = cmp.mapping.select_prev_item(),
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


lsp.on_attach(function(client, bufnr)
local opts = {buffer = bufnr, remap=false, silent=true}
	Map("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
	Map("n", "<leader>gd", function() vim.lsp.buf.definition() end, opts)
	Map("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end , opts)
	Map("n", "<leader>ca", function() vim.lsp.buf.code_action() end , opts)
	Map("n", "<leader>d", function() vim.diagnostic.open_float() end, opts)
	Map("n", "<localleader>ds", function() vim.lsp.buf.document_symbol() end, opts)

	Map("n", "<localleader>q","<cmd>cexpr []<CR><cmd>echo 'qf clean!'<CR>" ,opts)
	Map("n", "<leader>co","<cmd>copen <CR>" ,opts)
	Map("n", "<leader>]", function() vim.lsp.buf.incoming_calls() end, opts)
	Map("n", "<leader>[", function() vim.diagnostic.outgoing_calls() end, opts)
	Map("n", "]d", function() vim.diagnostic.goto_next() end, opts)
	Map("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
	Map("n", "]e", function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR}) end, opts)
	Map("n", "[e", function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR}) end, opts)
end)

lsp.setup()
