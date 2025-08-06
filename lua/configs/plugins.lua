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


	-- tpope block
	 'tpope/vim-surround',

	--gitsigns
	'lewis6991/gitsigns.nvim',

	-- file navigation
	{ 'ibhagwan/fzf-lua',
		-- optional for icon support
		dependencies = { 'kyazdani42/nvim-web-devicons' },
	},

	{
    "ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" }
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

	-- file manager
	{
		'stevearc/oil.nvim',
		opts = {},
		-- Optional dependencies
		dependencies = { { "nvim-tree/nvim-web-devicons" , opts = {} } },
		lazy = false,
	},
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
