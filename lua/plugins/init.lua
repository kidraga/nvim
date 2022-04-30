local fn = vim.fn

-- Autocommand that reloads neovim whenever you save this file
vim.cmd[[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerSync
  augroup end
]]

-- safe load packer
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  print("Failed loading packer. Probably not installed.")
  return
end

return packer.startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
  -- Theme
  use 'w0ng/vim-hybrid'
  use {'kristijanhusak/vim-hybrid-material'}
  use {'ulwlu/elly.vim'}
  use {'lighthaus-theme/vim-lighthaus'}
  use {'EdenEast/nightfox.nvim'}
  use {'adisen99/apprentice.nvim'}
  use {'jonathanfilip/vim-lucius'}
  use {'haystackandroid/snow'}
  use {'rebelot/kanagawa.nvim'}

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
  use {'hrsh7th/cmp-buffer'} -- completion in current buffer
  use {'hrsh7th/cmp-path'} -- auto complete file path
  use {'hrsh7th/cmp-cmdline'} -- completion in cmdline
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

  use {'ms-jpq/coq_nvim', branch = 'coq'}
  use {'ms-jpq/coq.artifacts', branch = 'artifacts'}
  use {'ms-jpq/coq.thirdparty', branch = '3p'}
end)
