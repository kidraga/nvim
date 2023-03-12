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
  print("Failed loading packer. Probably not installed. Try to install packer now...")
  local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim' .. install_path)
    vim.cmd [[packadd packer.nvim]]
    print("Successfully installed packer.")
  end
end

require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Theme
  use 'w0ng/vim-hybrid'
  use {'kristijanhusak/vim-hybrid-material'}
  use {'ulwlu/elly.vim', lock=true}
  use {'lighthaus-theme/vim-lighthaus'}
  use {'EdenEast/nightfox.nvim'}
  use {'adisen99/apprentice.nvim'}
  use {'jonathanfilip/vim-lucius'}
  use {'rebelot/kanagawa.nvim'}
  use {'sainnhe/everforest'}
  use {'gkapfham/vim-vitamin-onec'}
  use {'axvr/raider.vim'}
  use {'chriskempson/tomorrow-theme'}
  use { 'folke/tokyonight.nvim' }
  use({ 'rose-pine/neovim' })
  use { 'bdesham/biogoo' }
  use { 'barlog-m/oceanic-primal-vim' }
  use { 'vim-scripts/tango-morning.vim' }
  use { 'goatslacker/mango.vim' }
  use { 'yuttie/inkstained-vim' }
  use { 'aktersnurra/no-clown-fiesta.nvim' }
  use { 'nikolvs/vim-sunbather' }

  -- Colorizer
  use {'norcalli/nvim-colorizer.lua'}


  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"}
  use {'nvim-treesitter/playground'}
  use {'nvim-treesitter/nvim-treesitter-refactor'}

  -- lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Bufferline
  use {'akinsho/bufferline.nvim',
  requires = 'kyazdani42/nvim-web-devicons',
  lock = true}

  -- Nvim tree
  use { 'nvim-tree/nvim-tree.lua' }
  use {'nvim-tree/nvim-web-devicons'}


  -- ts tag auto-close
  use {'windwp/nvim-ts-autotag'}

  -- auto pair
  use {'windwp/nvim-autopairs'}

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- lsp
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},         -- Required
      {'hrsh7th/cmp-nvim-lsp'},     -- Required
      {'hrsh7th/cmp-buffer'},       -- Optional
      {'hrsh7th/cmp-path'},         -- Optional
      {'saadparwaiz1/cmp_luasnip'}, -- Optional
      {'hrsh7th/cmp-nvim-lua'},     -- Optional
      {'onsails/lspkind.nvim'},    -- Optional. Use it to create VSCode like icons stuff

      -- Snippets
      {'L3MON4D3/LuaSnip'},             -- Required
      {'rafamadriz/friendly-snippets'}, -- Optional
    }
  }

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
  use {"akinsho/toggleterm.nvim", lock=true}

  -- comment
  use {"terrortylor/nvim-comment"}

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
  -- code block syntax highlight
  use {'preservim/vim-markdown'}

  use {'mfussenegger/nvim-jdtls'}

  use {'ms-jpq/coq_nvim', branch = 'coq'}
  use {'ms-jpq/coq.artifacts', branch = 'artifacts'}
  use {'ms-jpq/coq.thirdparty', branch = '3p'}

  use {'tpope/vim-repeat'}
  use {'tpope/vim-surround'}
end)
