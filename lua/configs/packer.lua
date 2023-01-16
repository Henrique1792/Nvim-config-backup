return require('packer').startup({ function(use)
	use 'wbthomason/packer.nvim'
	-- aesthetics
	-- lualine
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	use 'flazz/vim-colorschemes'
	use 'rafi/awesome-vim-colorschemes'
	use 'folke/tokyonight.nvim'
	use 'rebelot/kanagawa.nvim'

	-- tpope block
	use 'tpope/vim-surround'
	use 'tpope/vim-fugitive'

	--gitsigns
	use {
		'lewis6991/gitsigns.nvim',
	}

	use { 'ibhagwan/fzf-lua',
		-- optional for icon support
		requires = { 'kyazdani42/nvim-web-devicons' }
	}
	use { 'junegunn/fzf', run = './install --bin', }

	-- undoTree
	use {
		"jiaoshijie/undotree",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	}
	-- Comments
	use 'numToStr/Comment.nvim'
	-- LineDiff
	use 'AndrewRadev/linediff.vim'


	-- Note taking
	-- use 'junegunn/goyo.vim'
	-- use 'junegunn/limelight.vim'
	-- use 'vuciv/vim-bujo'

	-- markdown note support
	use 'shime/vim-livedown'
	use 'vimwiki/vimwiki'

	-- color matching brackets/...
	use 'p00f/nvim-ts-rainbow'

	-- nnn file management
	use 'mcchrish/nnn.vim'

	-- lsp
	use { 'VonHeikemen/lsp-zero.nvim',
		requires = {
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
	}

	use {"kevinhwang91/nvim-bqf"}


	-- null-ls
	-- use 'jose-elias-alvarez/null-ls.nvim'
	-- use 'jayp0521/mason-null-ls.nvim'




	-- tree-sitter
	use 'nvim-treesitter/nvim-treesitter' --, {'do': ':TSUpdate'}
end,
})
