-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
  -- Theme
  use 'w0ng/vim-hybrid'
  use {'kristijanhusak/vim-hybrid-material'}
  use {'ulwlu/elly.vim'}
  use {'lighthaus-theme/vim-lighthaus'}

  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"}

  -- lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Bufferline
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

  -- Nvim tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function() require'nvim-tree'.setup {} end
  }
  -- use {'ms-jpq/chadtree', branch = 'chad', run = ':chaddeps'}


  -- ts tag auto-close
  use {'windwp/nvim-ts-autotag'}

  -- auto pair
  use {'windwp/nvim-autopairs'}

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- nvim-cmp
  use {'hrsh7th/nvim-cmp'}
  use {'neovim/nvim-lspconfig'}
  use {'hrsh7th/cmp-nvim-lsp'} -- auto import, snippets
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-path'} -- auto complete file path
  use {'hrsh7th/cmp-cmdline'}
  use {'hrsh7th/cmp-vsnip'}
  use {'hrsh7th/vim-vsnip'}
  use {'onsails/lspkind-nvim'}

  -- gitsigns
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    -- tag = 'release' -- To use the latest release
  }

  -- indent blankline
  use {"lukas-reineke/indent-blankline.nvim"}

  -- terminal
  use {"akinsho/toggleterm.nvim"}

  -- comment
  use {"terrortylor/nvim-comment"}

  -- lsp installer
  use {'williamboman/nvim-lsp-installer'}

  -- Find project root by .git file
  use {'airblade/vim-rooter'}

  use {'phaazon/hop.nvim'}

  -- better search highlight
  use {'romainl/vim-cool'}

  -- highlight current word under cursor
  use {'dominikduda/vim_current_word'}

  -- React and jsx
  use 'yuezk/vim-js'
  use 'maxmellon/vim-jsx-pretty'

  -- Markdown support
  -- save pic in markdown. Need to install xclip first
  use 'ferrine/md-img-paste.vim'
  -- markdown preview
  use {'iamcco/markdown-preview.nvim',  run = ':call mkdp#util#install()'}

  use {'mfussenegger/nvim-jdtls'}
end)
