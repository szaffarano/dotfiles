Plug 'tpope/vim-sensible'
Plug 'jamessan/vim-gnupg'
Plug 'vimwiki/vimwiki'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'dense-analysis/ale'
Plug 'elzr/vim-json'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'jlanzarotta/bufexplorer'
Plug 'preservim/nerdtree'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'

" GIT
Plug 'tpope/vim-fugitive'
" view git commits
Plug 'junegunn/gv.vim'
" figitive GBrowse opens github urls
Plug 'tpope/vim-rhubarb'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" colors for i3 config file
Plug 'PotatoesMaster/i3-vim-syntax'

" systemd unit file syntax highlighting
Plug 'wgwoods/vim-systemd-syntax'

" toml syntax highlighting
Plug 'cespare/vim-toml'

" LSP
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install() }, 'branch': 'release'}, 

" Themes
Plug 'dracula/vim'
Plug 'fatih/molokai'
Plug 'joshdick/onedark.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" display the result when searching
Plug 'henrik/vim-indexed-search'

" Close the current buffer
Plug 'moll/vim-bbye'
