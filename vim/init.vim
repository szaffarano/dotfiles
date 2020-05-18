" install plug-ins
call plug#begin('~/.local/share/nvim/plugged')
source ~/.config/nvim/plugins.vim
call plug#end()

let mapleader = ","

" clear matched search
nnoremap <leader><space>  :noh<CR>

" go config
source ~/.config/nvim/vim-go.vim

"
" Buffers
"
nnoremap <silent> <M-F12> :BufExplorer<CR>
nnoremap <silent> <F12> :bn<CR>
nnoremap <silent> <S-F12> :bp<CR>
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

" Edit vimr configuration file
nnoremap <Leader>ve :tabe $MYVIMRC<CR>

" Reload vimr configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>

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

nnoremap <silent> <F11> :set spell!<cr>
inoremap <silent> <F11> <C-O>:set spell!<cr>

set nospell					" spell off by default

" airline
"colorscheme onedark
colorscheme molokai
let g:airline_theme                        = 'onedark'
let g:airline_powerline_fonts              = 0
let g:airline#extensions#tabline#enabled   = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:rehash256                            = 1
let g:molokai_original                     = 1


set undolevels=1000

filetype plugin indent on   " allows auto-indenting depending on file type

syntax on                   " syntax highlighting

set guicursor=

" Remap escape
inoremap jk <Esc>

" disable header folding
let g:vim_markdown_folding_disabled = 1
let g:pandoc#folding#level          = 10

" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0

" disable math tex conceal feature
let g:tex_conceal       = ''
let g:vim_markdown_math = 1

" support front matter of various format
let g:vim_markdown_frontmatter      = 1  " for YAML format
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

" Tabularize
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

let g:GPGPreferArmor = 1

let g:sh_fold_enabled = 1

set foldlevelstart=1

" Use OR clipboard instead of vim's default
set clipboard=unnamedplus

" Nerdtree
map <C-n> :NERDTreeToggleVCS<CR>

" Fugitive
set diffopt+=vertical
