return require('packer').startup(function(use)

  -- VimWiki
  use 'vimwiki/vimwiki'

  -- neuron zettelkasten
  use { 'oberblastmeister/neuron.nvim', branch = 'unstable' }

  -- Zettelkasten method using Vimwiki
  use 'michal-h21/vim-zettel'

  -- Traskwarrior
  use 'tools-life/taskwiki'

  -- GnuPG
  use 'jamessan/vim-gnupg'

  -- Useful mappings
  use 'tpope/vim-unimpaired'

  use 'godlygeek/tabular'
  use 'junegunn/vim-easy-align'

  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- Color scheme
  use 'sainnhe/gruvbox-material'

  -- Fuzzy finder
  use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  -- intelligent prioritization when selecting files
  use {
    'nvim-telescope/telescope-frecency.nvim',
    requires = {'tami5/sql.nvim'}
  }

  -- LSP and completion
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  use 'ray-x/lsp_signature.nvim'

  -- Fugitive for Git
  use 'tpope/vim-fugitive'
  use 'rbong/vim-flog'
  use 'tpope/vim-rhubarb'

  -- status bar
  use {
      'glepnir/galaxyline.nvim',
      branch = 'main',
      config = function() require 'statusline' end,
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- startup screen
  use "mhinz/vim-startify"

  use 'monaqa/dial.nvim'

  -- Snippets
  use 'SirVer/ultisnips'

  -- tree-sitter support
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  -- dhall syntax highlight
  use 'vmchale/dhall-vim'

  -- displays a popup with key bindings
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
end)
