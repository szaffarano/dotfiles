let $data            = stdpath('data')
let $config          = stdpath('config')
let $plugged_data    = $data . '/plugged'
let $plugged_config  = $config . '/plugged'

" Install Plugins ---------------------- {{{

call plug#begin($plugged_data)
  source $config/plugins.vim
call plug#end()

" }}}

" Set Options ---------------------- {{{

" enable vim/neovim features
set nocompatible

filetype plugin on

" set syntax highlight
syntax on

" spell check disabled by default
set nospell

" use 2 spaces instead of tab (to replace existing tab use :retab)
" copy indent from current line when starting a new line
set autoindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" relative / hybrid line number switch
augroup toggle_relative_numbers
  autocmd InsertEnter * :setlocal norelativenumber
  autocmd InsertLeave * :setlocal relativenumber
augroup END

set number relativenumber

" disable temporary files for gopass
au BufNewFile,BufRead /dev/shm/gopass.* setlocal noswapfile nobackup noundofile

" autowrap markdown files
au BufRead,BufNewFile *.md setlocal textwidth=80 formatoptions+=wa

" set 80 and 120 column borders for good coding style
set colorcolumn=80,120

" set the title of the window to "filename [+=-] (path) - NVIM"
set title

" number of undo saved in memory
set undolevels=10000
set undoreload=10000

" set backupd, swap and undo locations 
set backupdir=$data/backup//
set directory=$data/swap//
set undodir=$data/undo//

" save undo trees in files
set undofile

" configure spell check
set spelllang=en,es,de_de

" use OS clipboard instead of vim's default
set clipboard+=unnamedplus

" write automatically when quitting buffer
set autowrite

" folding setup
set foldenable
set foldmethod=syntax
set foldlevelstart=1
let vimsyn_folding='af'
set foldnestmax=10
set foldcolumn=2

" }}}

" Mappings ---------------------- {{{

" jk leaves insert mode (same as <esc> key)
inoremap jk <Esc>

" redefine leader key
map , <leader>
map , <localleader>

" clear matched search
map <silent><esc> :noh<cr>

" search with very magic mode on
nnoremap <leader>/ /\v
" search with no magic
nnoremap <leader>? /\M

" disable anoying ex mode
nnoremap Q <Nop>

" edit vimrc configuration file
nnoremap <Leader>ve :tabe $MYVIMRC<CR>

" reload vimrc configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>

nnoremap <silent> <F11> :set spell!<cr>
inoremap <silent> <F11> <C-O>:set spell!<cr>

" moves through lines when wrapping
vmap <M-j> gj
vmap <M-k> gk
vmap <M-4> g$
vmap <M-6> g^
vmap <M-0> g^
nmap <M-j> gj
nmap <M-k> gk
nmap <M-4> g$
nmap <M-6> g^
nmap <M-0> g^

" }}}

" Plugins Configs ---------------------- {{{

for $file in split(glob($plugged_config . '/*.vim'), '\n')
    source $file
endfor

" }}}

" vim: filetype=vim foldmethod=marker foldlevel=0 foldcolumn=3
