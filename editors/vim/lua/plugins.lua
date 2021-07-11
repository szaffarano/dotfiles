return require('packer').startup(function(use)

  -- VimWiki
  use 'vimwiki/vimwiki'

  -- Neuron zettelkasten support
  use { 'oberblastmeister/neuron.nvim', branch = 'unstable' }

  -- Traskwarrior
  use 'tools-life/taskwiki'

  -- GnuPG transparent encryption
  use 'jamessan/vim-gnupg'

  -- Useful mappings
  use 'tpope/vim-unimpaired'

  -- alignment stuff
  use 'godlygeek/tabular'
  use 'junegunn/vim-easy-align'

  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- Color scheme
  use 'sainnhe/gruvbox-material'

  -- TJ Fuzzy finder
  use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- Intelligent prioritization when selecting files
  use {
    'nvim-telescope/telescope-frecency.nvim',
    requires = {'tami5/sql.nvim'}
  }

  -- LSP and completion
  use 'neovim/nvim-lspconfig'
  use "hrsh7th/nvim-compe"
  use 'ray-x/lsp_signature.nvim'

  -- Fugitive for Git
  use 'tpope/vim-fugitive'
  use 'rbong/vim-flog'
  use 'tpope/vim-rhubarb'

  -- Git decorations
  use "lewis6991/gitsigns.nvim"


  -- Fancy status bar XD
  use {
      'glepnir/galaxyline.nvim',
      branch = 'main',
      config = function() require 'statusline' end,
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- Startup screen
  use "mhinz/vim-startify"

  -- Auto-increment/decrement numbers
  use 'monaqa/dial.nvim'

  -- Snippets
  use 'SirVer/ultisnips'

  -- tree-sitter support
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  -- Syntax highlight for haskell dhall files
  use 'vmchale/dhall-vim'

  -- Displays a pop-up showing key bindings
  use {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup {
			plugins = {
					marks = true,
					registers = true,
					presets = {
							operators = false,
							motions = false,
							text_objects = false,
							windows = true,
							nav = true,
							z = true,
							g = true
					},
					spelling = {
						enabled = true,
						suggestions = 20,
					},
				},
				window = {
					border = "single", -- none, single, double, shadow
					position = "bottom", -- bottom, top
					margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
					padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
				},
				layout = {
					height = { min = 4, max = 25 }, -- min and max height of the columns
					width = { min = 20, max = 50 }, -- min and max width of the columns
					spacing = 3, -- spacing between columns
					align = "left", -- align columns left, center or right
				},
				ignore_missing = false,
				hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
				show_help = true,
				triggers = "auto",
      }
    end,
  }

  -- A pretty list for showing diagnostics
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
      }
    end
  }

  use { "iamcco/markdown-preview.nvim", ft = "markdown", run = "cd app && yarn install" }
end)
