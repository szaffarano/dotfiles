set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set mouse=v                 " middle-click paste with mouse
set hlsearch                " highlight search results
set tabstop=4               " number of columns occupied by a tab character
set softtabstop=4           " see multiple spaces as tab stops so <BS> does the 
                            " right thing
set shiftwidth=4            " width for auto indents
set autoindent              " indent a new line the same amount as the line 
                            " just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set colorcolumn=80,120               " set an 80 column border for good coding style
set title

set nobackup				" No backups
set nowritebackup			" No backups
set nowritebackup			" No backups
set noswapfile				" No backups

set spelllang=en,es,de_de

nnoremap <silent> <F12> :set spell!<cr>
inoremap <silent> <F12> <C-O>:set spell!<cr>

colorscheme desert

set undolevels=1000

filetype plugin indent on   " allows auto-indenting depending on file type

syntax on                   " syntax highlighting

set guicursor=

" Remap escape
inoremap jk <Esc>

" disable header folding
let g:vim_markdown_folding_disabled = 1
let g:pandoc#folding#level = 10

" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0

" disable math tex conceal feature
let g:tex_conceal = ''
let g:vim_markdown_math = 1

" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format

augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

" Install Plug plug-in manager
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  augroup vimplug_installed
    autocmd!
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  augroup END
endif

" install plug-ins
call plug#begin('~/.local/share/nvim/plugged')
source ~/.config/nvim/plugins.vim
call plug#end()

