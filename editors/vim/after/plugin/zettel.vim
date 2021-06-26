function! s:insert_id()
  if exists("g:zettel_current_id")
    return g:zettel_current_id
  else
    return "unnamed"
  endif
endfunction

let g:zettel_options = [{"front_matter" :
  \  [["tags" , ":zettel:"],
  \ [ "id" , function("s:insert_id")]]
\}]

let g:zettel_default_mappings = 0
" This is basically the same as the default configuration
augroup filetype_vimwiki
  autocmd!
  autocmd FileType vimwiki imap <silent> [[ [[<esc><Plug>ZettelSearchMap
  autocmd FileType vimwiki nmap T <Plug>ZettelYankNameMap
  autocmd FileType vimwiki xmap z <Plug>ZettelNewSelectedMap
  autocmd FileType vimwiki nmap gZ <Plug>ZettelReplaceFileWithLink
  autocmd FileType vimwiki nnoremap <leader>zB :ZettelBackLinks<CR>
  autocmd FileType vimwiki nnoremap <leader>zn :ZettelNew<space>
augroup END

let g:zettel_generated_index_title_level = 2
let g:zettel_backlinks_title_level = 2
let g:zettel_unlinked_notes_title_level = 2
let g:zettel_generated_tags_title_level = 2


