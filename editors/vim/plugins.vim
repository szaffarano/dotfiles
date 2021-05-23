" command line fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" similar to tabularize but with different features
 Plug 'junegunn/vim-easy-align'
 
" tabularize
Plug 'godlygeek/tabular'

" VimWiki
Plug 'vimwiki/vimwiki'

" Traskwarrior
Plug 'tools-life/taskwiki'

" GnuPG
Plug 'jamessan/vim-gnupg'

" Useful mappings
Plug 'tpope/vim-unimpaired'

" Vim Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" lint/autocompletion
Plug 'dense-analysis/ale'

" gruvbox theme
Plug 'gruvbox-community/gruvbox'

" vim-clap: interactive finder and dispatcher
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }

" vim-fugitive: git support
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'

" vim-rhubarb: integrates github with vim-fugitive
Plug 'tpope/vim-rhubarb'

" start screen
Plug 'mhinz/vim-startify'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" A collection of language packs for Vim.
Plug 'sheerun/vim-polyglot'

" Snippets
Plug 'SirVer/ultisnips'

" Shows ansi sequences correctly
Plug 'powerman/vim-plugin-AnsiEsc'

" tag bar. Recommended by TaskWiki, 'provides taskwiki file navigation'
Plug 'majutsushi/tagbar'
