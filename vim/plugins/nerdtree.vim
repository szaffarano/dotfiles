map <C-n> :NERDTreeToggleVCS<CR>

let g:NERDTreeShowHidden      = 1
let g:NERDTreeMinimalUI       = 1
let g:NERDTreeIgnore          = []
let g:NERDTreeStatusline      = ''
let g:NERDTreeShowLineNumbers = 1

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") 
    \ && b:NERDTree.isTabTree()) | q | endif

" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
autocmd FileType nerdtree setlocal relativenumber
