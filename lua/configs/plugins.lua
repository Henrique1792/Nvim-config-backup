local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


local plugins = {
	-- aesthetics
	'flazz/vim-colorschemes',
	'rafi/awesome-vim-colorschemes',
	'folke/tokyonight.nvim',
	'rebelot/kanagawa.nvim',

	-- lualine
	 {
	 	'nvim-lualine/lualine.nvim',
	 	dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }
	 },

	--gitsigns
	'lewis6991/gitsigns.nvim',

	-- file navigation
	{ 'ibhagwan/fzf-lua',
		-- optional for icon support
		dependencies = { 'kyazdani42/nvim-web-devicons' },
	},

	-- undoTree
	{
		"jiaoshijie/undotree",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	-- Comments
	'numToStr/Comment.nvim',
	-- LineDiff
	'AndrewRadev/linediff.vim',

	-- markdown note support
	 'shime/vim-livedown',
	 'vimwiki/vimwiki',

	-- buffers and registers 
	"kevinhwang91/nvim-bqf",
	{
		"tversteeg/registers.nvim",
		config = function()
			require("registers").setup({
				window = {
					transparency = 0,
				},
			})
		end,
	},

	-- file manager
	{
		'stevearc/oil.nvim',
		opts = {},
		-- Optional dependencies
		dependencies = { { "nvim-tree/nvim-web-devicons" , opts = {} } },
		lazy = false,
	},
	-- mini block
	{ 'nvim-mini/mini.completion',
		version = '*',
		dependencies = {
			{
				'nvim-mini/mini.icons',
				config = function()
					require("mini.icons").setup()
					require("mini.icons").tweak_lsp_kind()
				end,
			},
			'nvim-mini/mini.snippets',
		},
	},
	{ 'nvim-mini/mini.surround',
		version = '*',
		config = function()
			require("mini.surround").setup({
				mappings = {
					add = 'as', -- Add surrounding in Normal and Visual modes
					delete = 'ds', -- Delete surrounding
					find = 'fs', -- Find surrounding (to the right)
					find_left = 'Fs', -- Find surrounding (to the left)
					highlight = 'hs', -- Highlight surrounding
					replace = 'rs', -- Replace surrounding

					suffix_last = 'l', -- Suffix to search with "prev" method
					suffix_next = 'n', -- Suffix to search with "next" method
				},
			})
		end
	},
	{ 'nvim-mini/mini.pairs',
		version = '*',
		config = function()
			require("mini.pairs").setup()
		end
	},
	-- tree-sitter
	'nvim-treesitter/nvim-treesitter',
}

local opts = {}
require("lazy").setup(plugins, opts)
