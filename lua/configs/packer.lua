-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- lualine
  use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

	use 'flazz/vim-colorschemes'
	use 'rafi/awesome-vim-colorschemes'
	use 'tpope/vim-surround'

-- tpope block
	use 'tpope/vim-fugitive'
	use 'tpope/vim-eunuch'

-- signify
	-- if has('nvim') || has('patch-8.0.902')
	-- 	use 'mhinz/vim-signify'
	-- else
	-- 	use 'mhinz/vim-signify', { 'branch': 'legacy' }
	-- endif
	use 'junegunn/fzf' -- { 'do': { -> fzf#install() } }
	use 'junegunn/fzf.vim'

-- airline
-- 	use 'vim-airline/vim-airline'
-- 	use 'vim-airline/vim-airline-themes'
	use 'ryanoasis/vim-devicons'


-- undoTree
	use 'simnalamburt/vim-mundo'
-- Comments
	use 'numToStr/Comment.nvim'
-- LineDiff
	use 'AndrewRadev/linediff.vim'


-- Note taking
	use 'junegunn/goyo.vim'
	use 'junegunn/limelight.vim'
	use 'vuciv/vim-bujo'

-- markdown note support
	use 'shime/vim-livedown'
	use 'vimwiki/vimwiki'

-- color matching chars
	use 'p00f/nvim-ts-rainbow'


-- nnn file management
	use 'mcchrish/nnn.vim'

-- lsp
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'
	use 'tami5/lspsaga.nvim'

	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'

-- tags 
	use 'ludovicchabant/vim-gutentags'

-- tree-sitter
	use 'nvim-treesitter/nvim-treesitter' --, {'do': ':TSUpdate'}
	use 'sedan07/vim-mib'
end)
