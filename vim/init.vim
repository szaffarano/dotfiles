set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set mouse=v                 " middle-click paste with mouse
set hlsearch                " highlight search results
set tabstop=4               " number of columns occupied by a tab character
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the 
                            " right thing
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line 
                            " just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80,120               " set an 80 column border for good coding style
set title

set nobackup				" No backups
set nowritebackup			" No backups
set nowb					" No backups
set noswapfile				" No backups

colorscheme desert

set undolevels=1000

filetype plugin indent on   " allows auto-indenting depending on file type

syntax on                   " syntax highlighting

set guicursor=

" Remap escape
inoremap jk <Esc>

" Install Plug plugin manager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  augroup vimplug_installed
    autocmd!
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  augroup END
endif

" install plugins
call plug#begin('~/.vim/plugged')
source ~/.config/nvim/plugins.vim
call plug#end()
