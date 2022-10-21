local M = {}

local ok, packer = pcall(require, "packer")
if not ok then
  print("packer plugin is not installed")
  return M
end

function M.setup(bootstrap)
  local conf = {
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "rounded" })
      end,
    },
  }

  local function plugins(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- Speed up loading Lua modules in Neovim to improve startup time.
    use("lewis6991/impatient.nvim")

    -- GnuPG transparent encryption
    use("jamessan/vim-gnupg")

    -- LSP configs
    use({
      "neovim/nvim-lspconfig",

      config = function()
        require("sebas.lsp").setup()
        -- require("config.dap").setup()
      end,
    })

    use("williamboman/nvim-lsp-installer")
    use("ray-x/lsp_signature.nvim")
    use("folke/neodev.nvim")

    -- Statusline
    use({
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons", opt = true }, -- icons support
    })

    -- Color scheme
    use("marko-cerovac/material.nvim")

    -- Fugitive for Git
    use("tpope/vim-fugitive")
    use("rbong/vim-flog")
    use("tpope/vim-rhubarb")

    -- Git decorations
    use("lewis6991/gitsigns.nvim")

    -- Startup screen
    use("mhinz/vim-startify")

    -- tree-sitter support
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

    -- Autocompletion
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-nvim-lua")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lsp-document-symbol")
    use("saadparwaiz1/cmp_luasnip")
    use("tamago324/cmp-zsh")
    use("ray-x/cmp-treesitter")

    -- Golang
    use("ray-x/go.nvim")
    use("ray-x/guihua.lua")
    use("mfussenegger/nvim-dap")
    use("rcarriga/nvim-dap-ui")
    use("theHamsta/nvim-dap-virtual-text")
    -- use("nvim-telescope/telescope-dap.nvim")

    -- Adds vscode-like pictograms to neovim built-in lsp:
    use("onsails/lspkind-nvim")

    -- Comparators
    use("lukas-reineke/cmp-under-comparator")

    -- Snippets
    use("L3MON4D3/LuaSnip")
    use("rafamadriz/friendly-snippets")

    -- Telescope
    use({
      "nvim-telescope/telescope.nvim",
      requires = { { "nvim-lua/plenary.nvim" } },
    })
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use("nvim-telescope/telescope-packer.nvim")
    use({ "nvim-telescope/telescope-file-browser.nvim" })
    use({
      "nvim-telescope/telescope-frecency.nvim",
      requires = { "tami5/sqlite.lua" },
    })

    -- Format code
    use("sbdchd/neoformat")

    -- Terminal
    use("voldikss/vim-floaterm")

    -- Wiki
    use("vimwiki/vimwiki")

    -- Useful mappings
    use("tpope/vim-unimpaired")

    -- Alignment
    use("godlygeek/tabular")

    -- Manage comments
    use("numToStr/Comment.nvim")

    -- reopen files at last edites positions
    use("farmergreg/vim-lastplace")

    -- github copilot
    -- use("github/copilot.vim")

    if bootstrap then
      packer.sync()
    end
  end

  packer.init(conf)
  packer.startup(plugins)
end

return M
