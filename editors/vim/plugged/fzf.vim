command! -bang ProjectFiles call fzf#vim#files('~/projects', <bang>-5)

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

" List buffers
nnoremap <silent> <leader>b :Buffers<CR>

" List projects
nnoremap <silent> <leader>p :ProjectFiles<CR>
