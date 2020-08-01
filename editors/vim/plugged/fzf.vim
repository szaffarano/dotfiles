command! -bang ProjectFiles call fzf#vim#files('~/projects', <bang>-5)

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

" List projects
nnoremap <silent> <leader>p :ProjectFiles<CR>

let g:fzf_layout = { 'window': 'call FloatingCenteredWin()' }
 function! FloatingCenteredWin() abort
     let buf = nvim_create_buf(v:false, v:true)

     " Adjust window size
     let height = float2nr(3 * &lines / 5)
     let width = float2nr(&columns - (&columns / 4))
     let col = float2nr((&columns - width) / 2)

     let opts = {
                 \ 'relative': 'editor',
                 \ 'row': &lines / 5,
                 \ 'col': col,
                 \ 'width': width,
                 \ 'height': height,
                 \ 'style' : 'minimal'
                 \ }
     " Create window
     let win = nvim_open_win(buf, v:true, opts)
endfunction
