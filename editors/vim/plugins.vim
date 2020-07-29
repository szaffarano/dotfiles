" command line fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" tabularize
Plug 'junegunn/vim-easy-align'

" VimWiki
Plug 'vimwiki/vimwiki'

" GnuPG
Plug 'jamessan/vim-gnupg'

" Useful mappings
Plug 'tpope/vim-unimpaired'

" Vim Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" lint/autocompletion
Plug 'dense-analysis/ale'

" srcery theme
Plug 'srcery-colors/srcery-vim'

" vim-clap: interactive finder and dispatcher
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }

" vim-fugitive: git support
Plug 'tpope/vim-fugitive'

" vim-rhubarb: integrates github with vim-fugitive
Plug 'tpope/vim-rhubarb'
