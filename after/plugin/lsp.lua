-- trying kindly to remove verbosing
function Map(mode, sequence, command, params)
	vim.keymap.set(mode, sequence, command, params)
end

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
	cmd = {"bash-language-server", "start"},
	filetypes = {"bash", "sh"}
}
vim.lsp.enable('bashls')



vim.lsp.config['rust'] = {
	cmd = { 'rust-analyzer'},
	filetypes = { 'rust' },
	root_markers = { 'Cargo.toml', '.git' },
    settings = {
    }
}
vim.lsp.enable('rust')


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
vim.o.completeopt = 'menuone,noselect,fuzzy,nosort'

local miniCompletion = require('mini.completion')
miniCompletion.setup({
	delay = { completion = 100, info = 100, signature = 50 },
	signature = { enabled = true },
	completion = {
		documentation = { auto_show = true, auto_show_delay_ms = 500 },
		menu = {
			auto_show = true,
			draw = {
				treesitter = { "lsp" },
				columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "kind" } },
			},
		},
	},
	window = {
		info = {border = 'single'},
		signature = {border = 'single'},
	},

	mappings = {
		force_twostep = '<C-Space>',
		force_fallback = '<A-Space>',
	},
})

vim.diagnostic.config({
  -- Use the default configuration
  virtual_lines = true
})
