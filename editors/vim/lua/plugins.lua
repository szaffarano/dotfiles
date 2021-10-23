return require("packer").startup(function(use)
  -- VimWiki
  use "vimwiki/vimwiki"

  -- Traskwarrior
  use "tools-life/taskwiki"

  -- GnuPG transparent encryption
  use "jamessan/vim-gnupg"

  -- Useful mappings
  use "tpope/vim-unimpaired"

  -- alignment stuff
  use "godlygeek/tabular"
  use "junegunn/vim-easy-align"

  -- Packer can manage itself as an optional plugin
  use { "wbthomason/packer.nvim", opt = true }

  -- Color scheme
  use "sainnhe/gruvbox-material"

  -- TJ Fuzzy finder
  use {
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
  }

  -- Intelligent prioritization when selecting files
  use {
    "nvim-telescope/telescope-frecency.nvim",
    requires = { "tami5/sql.nvim" },
  }

  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

  use { "tpope/vim-commentary" }

  -- LSP
  use "neovim/nvim-lspconfig"

  -- Completion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/cmp-nvim-lsp"
  use "quangnguyen30192/cmp-nvim-ultisnips"
  use "tamago324/cmp-zsh"
  use "onsails/lspkind-nvim"

  -- Fugitive for Git
  use "tpope/vim-fugitive"
  use "rbong/vim-flog"
  use "tpope/vim-rhubarb"

  -- Git commits and diff support
  use "rhysd/committia.vim"
  use "sindrets/diffview.nvim"

  -- Git decorations
  use "lewis6991/gitsigns.nvim"

  -- status bar
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  }

  -- Startup screen
  use "mhinz/vim-startify"

  -- Snippets
  use {
    "SirVer/ultisnips",
    requires = { "honza/vim-snippets" },
    config = function()
      vim.g.UltiSnipsRemoveSelectModeMappings = 0
    end,
  }

  -- tree-sitter support
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

  -- Syntax highlight for haskell dhall files
  use "vmchale/dhall-vim"

  -- Displays a pop-up showing key bindings
  use "folke/which-key.nvim"

  -- A pretty list for showing diagnostics
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end,
  }

  -- Preview Markdown files in a hosted HTML server
  use { "iamcco/markdown-preview.nvim", ft = "markdown", run = "cd app && yarn install" }

  use { "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" }

  -- Format code
  use "sbdchd/neoformat"

  -- Syntax highlight for i3
  use "mboughaba/i3config.vim"

  -- Undotree helper
  use "mbbill/undotree"

  -- Avro syntax highlight
  use "gurpreetatwal/vim-avro"

  -- Golang support
  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"
  use "theHamsta/nvim-dap-virtual-text"
  use "ray-x/go.nvim"

  -- Folding support
  use "pseewald/vim-anyfold"

  --- nnn support
  use "luukvbaal/nnn.nvim"

  -- terminals in a floating window
  use "voldikss/vim-floaterm"
end)
