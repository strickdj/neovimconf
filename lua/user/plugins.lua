local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

return packer.startup(function(use)
    -- Packer Plugin Manager
    use("wbthomason/packer.nvim")

    use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
    use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
    use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
    use("goolord/alpha-nvim")

    -- use "kyazdani42/nvim-tree.lua"
    -- use "akinsho/bufferline.nvim"
    -- use "moll/vim-bbye"
    -- use "nvim-lualine/lualine.nvim"
    -- use "akinsho/toggleterm.nvim"
    -- use "ahmedkhalf/project.nvim"
    -- use "lewis6991/impatient.nvim"
    -- use "lukas-reineke/indent-blankline.nvim"
    -- use "goolord/alpha-nvim"
    use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight

    -- Completion cmp plugins
    use("saadparwaiz1/cmp_luasnip") -- snippet completions
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/nvim-cmp")

    -- Snippets plugins
    use("L3MON4D3/LuaSnip") --snippet engine
    use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

    -- LSP
    use("neovim/nvim-lspconfig") -- enable LSP
    use("williamboman/nvim-lsp-installer") -- simple to use language server installer
    use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for

    use({
        "jose-elias-alvarez/null-ls.nvim",
        -- disable = true,
    })

    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })
    -- use "JoosepAlviste/nvim-ts-context-commentstring"

    -- Git
    -- use "lewis6991/gitsigns.nvim"
    use("airblade/vim-gitgutter")

    -- kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk

    use("marko-cerovac/material.nvim")
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })

    use("folke/which-key.nvim")
    use("easymotion/vim-easymotion")
    use("liuchengxu/vim-better-default")

    use("mfussenegger/nvim-lint")

    use({
        "junegunn/fzf",
        run = function()
            vim.fn["fzf#install"]()
        end,
    })
    use("junegunn/fzf.vim")

    use({
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup({})
        end,
    })

    use({
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } },
    })
    use("sharkdp/fd")
    use({
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
    })

    use("editorconfig/editorconfig-vim")

    use("StanAngeloff/php.vim")

    use("guns/vim-sexp")
    --  use 'lewis6991/impatient.nvim'
    use("mbbill/undotree")

    use("radenling/vim-dispatch-neovim")
    use("tpope/vim-abolish")
    use("tpope/vim-commentary")
    use("tpope/vim-dispatch")
    use("tpope/vim-eunuch")
    use("tpope/vim-fugitive")
    use("tpope/vim-repeat")
    use("tpope/vim-sexp-mappings-for-regular-people")
    use("tpope/vim-sleuth")
    use("tpope/vim-surround")
    use("tpope/vim-unimpaired")
    use("tpope/vim-vinegar")

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
