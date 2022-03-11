vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
	use 'wbthomason/packer.nvim'

	-- Telescope
	use {
	  'nvim-telescope/telescope.nvim',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Tree
	use {
	    'kyazdani42/nvim-tree.lua',
	    requires = {
	      'kyazdani42/nvim-web-devicons', -- optional, for file icon
	    },
	    config = function() require'nvim-tree'.setup {} end
	}

	-- Highlight
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}


  -- Line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Theme
  use 'marko-cerovac/material.nvim'

  -- Auto Pairs
  use 'windwp/nvim-autopairs'

  -- Comments
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

  -- Git
  use 'kdheepak/lazygit.nvim'
  
	-- LSP
	use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
	use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
	use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
	use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
	use 'L3MON4D3/LuaSnip' -- Snippets plugin
end)
