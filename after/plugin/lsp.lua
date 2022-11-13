local keymap = vim.keymap

-- trying kindly to remove verbosing
function Map(mode, sequence, command, params)
	keymap.set(mode, sequence, command, params)
end

--Required packages
local lspconfig = require('lspconfig')
local mason = require('mason')
local masonlspconfig = require('mason-lspconfig')
local null_ls = require('null-ls')
local mason_null_ls = require("mason-null-ls")

mason.setup()
masonlspconfig.setup({
	ensure_installed = { "html", "pyright", "gopls", "sumneko_lua", "clangd", "bashls" },
})

masonlspconfig.setup_handlers({
	function (server_name) -- default handler (optional)
		lspconfig[server_name].setup{}
	end,
})

mason_null_ls.setup({
})

mason_null_ls.setup_handlers {
    function(source_name, methods)
      -- all sources with no handler get passed here
      -- Keep original functionality of `automatic_setup = true`
      require('mason-null-ls.automatic_setup')(source_name, methods)
    end,
    spell = function(source_name, methods)
      null_ls.register(null_ls.builtins.completion.spell)
    end,
    djlint = function(source_name, methods)
      null_ls.register(null_ls.builtins.formatting.djlint)
      null_ls.register(null_ls.builtins.diagnostics.djlint)
    end,
}

null_ls.setup()
-- comment
local comment = require('Comment')
comment.setup()
