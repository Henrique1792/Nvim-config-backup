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
	-- lualine
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }
	},

	'flazz/vim-colorschemes',
	'rafi/awesome-vim-colorschemes',
	'folke/tokyonight.nvim',
	'rebelot/kanagawa.nvim',

	-- tpope block
	 'tpope/vim-surround',
	 'tpope/vim-fugitive',

	--gitsigns
	'lewis6991/gitsigns.nvim',

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

	-- color matching brackets/...
	'p00f/nvim-ts-rainbow',

	-- nnn file management
	'mcchrish/nnn.vim',

	-- lsp
	{ 'VonHeikemen/lsp-zero.nvim',
		dependencies = {
		-- LSP Support
		{'neovim/nvim-lspconfig'},
		{'williamboman/mason.nvim'},
		{'williamboman/mason-lspconfig.nvim'},

		-- Autocompletion
		{'hrsh7th/nvim-cmp'},
		{'hrsh7th/cmp-buffer'},
		{'hrsh7th/cmp-path'},
		{'saadparwaiz1/cmp_luasnip'},
		{'hrsh7th/cmp-nvim-lsp'},
		{'hrsh7th/cmp-nvim-lua'},

		-- Snippets
		{'L3MON4D3/LuaSnip'},
		-- Snippet Collection (Optional)
		{'rafamadriz/friendly-snippets'},
		},
	},

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


	-- tree-sitter
	'nvim-treesitter/nvim-treesitter',
}

local opts = {}
require("lazy").setup(plugins, opts)
