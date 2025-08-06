-- trying kindly to remove verbosing
function Map(mode, sequence, command, params)
	vim.keymap.set(mode, sequence, command, params)
end


--vim.lsp.config['tsserver'] = {}
--vim.lsp.enable('tsserver')

vim.lsp.config['gopls'] = {
	cmd = { 'gopls' },
	filetypes = { 'go', 'gomod', 'gowork', 'tmpl' },
	root_markers = { 'go.mod', '.git', 'go.workaroundk' },
	settings = {
		gopls = {
			completeUnimported = true,
			buildFlags = { },
		}
	}
}
vim.lsp.enable('gopls')

-- vim.lsp.config['pyright'] = {}
-- vim.lsp.enable('pyright')

vim.lsp.config['clangd'] = {
	cmd = { 'clangd', '--background-index' },
	root_markers = { 'compile_commands.json', 'compile_flags.txt' },
	filetypes = { 'c', 'cpp' },
}
vim.lsp.enable('clangd')

vim.lsp.config['bashls'] = {
	cmd = {'bash-language-server'},
}
vim.lsp.enable('bashls')

vim.lsp.config['luals'] = {
	cmd = { 'lua-language-server'},
	filetypes = { 'lua' },
	root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			}
		}
	}
}
vim.lsp.enable('luals')

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
      vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
      vim.keymap.set('i', '<C-Space>', function()
        vim.lsp.completion.get()
      end)
    end
  end,
})

-- Diagnostics
vim.diagnostic.config({
  -- Use the default configuration
  virtual_lines = true
})

