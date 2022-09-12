-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup({function(use)
  use 'wbthomason/packer.nvim'
  -- lines 
  use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

	use 'flazz/vim-colorschemes'
	use 'rafi/awesome-vim-colorschemes'

-- tpope block
	use 'tpope/vim-surround'
	use 'tpope/vim-fugitive'
	use 'tpope/vim-eunuch'

    --gitsigns 
    use {
        'lewis6991/gitsigns.nvim',
    }

    use { 'ibhagwan/fzf-lua',
    -- optional for icon support
    requires = { 'kyazdani42/nvim-web-devicons' }
    }


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

-- tree-sitter
	use 'nvim-treesitter/nvim-treesitter' --, {'do': ':TSUpdate'}
end,

--    config = {
--        display = {
--            open_fn = function()
--                return require('packer.util').float({ border = 'bottom' })
--            end
--        }
--    }
})
