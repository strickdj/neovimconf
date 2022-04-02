return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'marko-cerovac/material.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use 'airblade/vim-gitgutter'
  use 'folke/which-key.nvim'
  use 'easymotion/vim-easymotion'
  use 'liuchengxu/vim-better-default'

  use 'dense-analysis/ale'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'


  use {
    'jose-elias-alvarez/null-ls.nvim',
    as = 'null-ls'
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUupdate',
  }


  use {
    'junegunn/fzf',
    run = function() vim.fn['fzf#install']() end
  }
  use 'junegunn/fzf.vim'
  use '/usr/local/opt/fzf'


  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup{}
    end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use 'sharkdp/fd'
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  }

  use 'editorconfig/editorconfig-vim'

--  use 'PeterRincker/vim-argumentative'

--  use 'Olical/conjure'
--  use 'Olical/nvim-local-fennel'
--  use 'clojure-vim/clojure.vim'
--  use 'clojure-vim/vim-jack-in'
--
--  use 'guns/vim-sexp'
--  use 'jiangmiao/auto-pairs'
--  use 'lewis6991/impatient.nvim'
  use 'mbbill/undotree'

  use 'radenling/vim-dispatch-neovim'
  use 'tpope/vim-abolish'
  use 'tpope/vim-commentary'
  use 'tpope/vim-dispatch'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-repeat'
  use 'tpope/vim-sexp-mappings-for-regular-people'
  use 'tpope/vim-sleuth'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-vinegar'
  use 'lukas-reineke/virt-column.nvim'

end)
