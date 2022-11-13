--LSPSaga setup
--
local keymap = vim.keymap

-- trying kindly to remove verbosing
function Map(mode, sequence, command, params)
	keymap.set(mode, sequence, command, params)
end

local saga = require('lspsaga')
saga.init_lsp_saga({
	diagnostic_header = {
		'✗',
		'Ⅺ',
		'ツ',
		'Δ',
	},
	move_in_saga = {
		prev = "<C-p>",
		next="<C-n>"
	},
})

-- Lsp finder find the symbol definition implement reference
Map("n", "<leader>gf", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
-- Code action
Map({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
-- Mass rename
Map("n", "<localleader>gr", "<cmd>Lspsaga rename<CR>", { silent = true })
-- Peek Definition
Map("n", "<leader>gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

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
