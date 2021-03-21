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

" theme
colorscheme gruvbox

filetype plugin on

" set syntax highlight
syntax on

" spell check disabled by default
set nospell

" use 2 spaces instead of tab (to replace existing tab use :retab)
" copy indent from current line when starting a new line
set autoindent
set smartindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set paste

" set 80 and 120 column borders for good coding style
set colorcolumn=80,120

" No extra space when join lines
set nojoinspaces

" buffers become hidden when they are abandoned
set hidden

" relative / hybrid line number switch
augroup toggle_relative_numbers
  autocmd InsertEnter * :setlocal norelativenumber
  autocmd InsertLeave * :setlocal relativenumber
augroup END

set number relativenumber

" autowrap markdown files
au BufRead,BufNewFile *.md setlocal textwidth=80 formatoptions+=wa

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

" write automatically when quitting buffer
set autowrite

" folding setup
set nofoldenable

" set search ignorecase
set ignorecase
set smartcase
set incsearch
set hlsearch

""Minimal number of screen lines to keep above and below the cursor.
set scrolloff=5


" }}}

" Mappings ---------------------- {{{

" jk leaves insert mode (same as <esc> key)
inoremap jk <Esc>
inoremap kj <Esc>

" redefine leader key
map <space> <leader>
map <space> <localleader>

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

" edit plugins.vim configuration file
nnoremap <Leader>vp :tabe $config/plugins.vim<CR>

" reload vimrc configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>

" toggle spelling
nnoremap <silent> <F12> :set spell!<cr>
inoremap <silent> <F12> <C-O>:set spell!<cr>

" go to previous buffer
nnoremap <silent> <leader><Leader> <C-^>

" close current buffer
nnoremap <silent> <leader>d :bdel<CR>

" }}}

" Plugins Configs ---------------------- {{{

for $file in split(glob($plugged_config . '/*.vim'), '\n')
    source $file
endfor

" }}}

" vim: filetype=vim foldmethod=marker foldlevel=0 foldcolumn=3
