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

end)
