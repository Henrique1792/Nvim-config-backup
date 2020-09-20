:lua << END
-- C/CPP and bash
	require'nvim_lsp'.clangd.setup{}
	require'nvim_lsp'.bashls.setup{}
	
-- HTML+CSS
	require'nvim_lsp'.html.setup{}
	require'nvim_lsp'.cssls.setup{}

-- Golang
	require'nvim_lsp'.gopls.setup{}

-- Python
	require'nvim_lsp'.jedi_language_server.setup{}

-- VUE
	require'nvim_lsp'.vuels.setup{}
	
END