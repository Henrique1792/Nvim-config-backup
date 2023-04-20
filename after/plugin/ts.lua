
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
	sync_install=false,
	auto_install=true,
	ensure_installed = {
		"python",
		"c",
		"go",
		"gomod",
		"bash",
		"cpp",
	},
}

