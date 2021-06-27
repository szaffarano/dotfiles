inoremap jk <Esc>
inoremap kj <Esc>

inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>

" system clipboard
vmap <leader>y "+y
vmap <leader>d "+d
nmap <leader>y "+yy
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>p "+p
vmap <leader>P "+P

" move between tabs and buffers
noremap <C-Left> :silent tabprev<CR> :redraw!<CR>
noremap <C-Right> :silent tabnext<CR> :redraw!<CR>
noremap <Left> :silent bp<CR> :redraw!<CR>
noremap <Right> :silent bn<CR> :redraw!<CR>

" toggles the paste mode
nmap <C-p> :set paste!<CR>

" move lines with Ctrl + (Shift) +J/K
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" redefine leader key
"map <space> <leader>
"map <space> <localleader>

" clear matched search
map <silent><C-l> :noh<cr>

" search with very magic mode on
nnoremap <leader>/ /\v
" search with no magic
nnoremap <leader>? /\M

" disable annoying ex mode
nnoremap Q <Nop>

" reload vimrc configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>

" toggle spelling
nnoremap <silent> <F12> :set spell!<cr>
inoremap <silent> <F12> <C-O>:set spell!<cr>

" go to previous buffer
nnoremap <silent> <leader><Leader> <C-^>

" close current buffer
nnoremap <silent> <leader>d :bdel<CR>
