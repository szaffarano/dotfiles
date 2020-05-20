" Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

" Declare group for autocmd for whole init.vim, and clear it
" Otherwise every autocmd will be added to group each time vimrc sourced!
augroup vimrc
  autocmd!
augroup END

" Install Plugins ---------------------- {{{
call plug#begin('~/.local/share/nvim/plugged')
source ~/.config/nvim/plugins.vim
call plug#end()
" }}}

" Plugins Configs ---------------------- {{{
for file in split(glob("~/.config/nvim/plugins/*.vim"), '\n')
    execute 'source' file
endfor
" }}}

" General Configs ---------------------- {{{

" Remap escape
inoremap jk <Esc>

" weird hack for nerdtree to work
let mapleader = "\\"
let maplocalleader = "\\"
map <space> <leader>
map <space> <localleader>

" search with very magic mode on
nnoremap <leader>/ /\v
" search with no magic
nnoremap <leader>? /\M

" clear matched search
map <silent><esc> :noh<cr>

"toggle between absolute -> relative line number
nnoremap <A-a> :let [&nu, &rnu] = [&nu, &nu+&rnu==1]<CR>

" arrow keys resize windows
nnoremap <Left> :vertical resize -10<CR>
nnoremap <Right> :vertical resize +10<CR>
nnoremap <Up> :resize -10<CR>
nnoremap <Down> :resize +10<CR>

imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Disable anoying ex mode
nnoremap Q <Nop>

" Edit vimr configuration file
nnoremap <Leader>ve :tabe $MYVIMRC<CR>

" Reload vimr configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>

filetype plugin indent on   " allows auto-indenting depending on file type
" }}}

" Set Options ---------------------- {{{
"colorscheme onedark
colorscheme molokai

set nospell					" spell off by default
set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set mouse=v                 " middle-click paste with mouse
set hlsearch                " highlight search results

" use 4 spaces instead of tab (to replace existing tab use :retab)
" copy indent from current line when starting a new line
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Save session
nnoremap <leader>ss :mksession! ~/.local/share/nvim/sessions/*.vim<C-D><BS><BS><BS><BS><BS>

" Reload session
nnoremap <leader>sl :so ~/nvim/sessions/*.vim<C-D><BS><BS><BS><BS><BS>

set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set colorcolumn=80,120               " set an 80 column border for good coding style
set title

" number of undo saved in memory
set undolevels=10000 " How many undos
set undoreload=10000 " number of lines to save for undo

" set the directory where the swap file will be saved
set backupdir=~/.local/share/nvim/backup//
set directory=~/.local/share/nvim/swap//

" save undo trees in files
set undofile
set undodir=~/.local/share/nvim/undo//

set spelllang=en,es,de_de
nnoremap <silent> <F11> :set spell!<cr>
inoremap <silent> <F11> <C-O>:set spell!<cr>

" Fold related
set foldlevelstart=0 " Start with all folds closed
set foldtext=general#FoldText()

let g:sh_fold_enabled = 1

" Use OR clipboard instead of vim's default
set clipboard+=unnamedplus

set noswapfile				" No backups

" avoid delay
set updatetime=300

" no swap file! This is just annoying
set noswapfile

" write automatically when quitting buffer
set autowrite

" Show the substitution LIVE
set inccommand=nosplit

" Better ex autocompletion
set wildmenu
set wildmode=list:longest,full

" relative / hybrid line number switch
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" }}}
