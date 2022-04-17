let g:vimwiki_fold_blank_lines = 0  " set to 1 to fold blank lines
let g:vimwiki_header_type = '#'     " set to '=' for wiki syntax

setlocal foldmethod=expr 
setlocal foldenable 
setlocal foldlevel=2
setlocal foldcolumn=4

set foldlevelstart=20

setlocal foldexpr=Fold(v:lnum)
setlocal foldtext=VimwikiFoldTextCustom()

function! Fold(lnum)
  let fold_level = strlen(matchstr(getline(a:lnum), '^' . g:vimwiki_header_type . '\+'))
  if (fold_level)
    return '>' . fold_level  " start a fold level
  endif
  if getline(a:lnum) =~? '\v^\s*$'
    if (strlen(matchstr(getline(a:lnum + 1), '^' . g:vimwiki_header_type . '\+')) > 0 && !g:vimwiki_fold_blank_lines)
      return '-1' " don't fold last blank line before header
    endif
  endif
  return '=' " return previous fold level
endfunction

" taked from vimwiki, but shows the correct num of hidden lines (which changed 
" because I also changed Fold logic
function! VimwikiFoldTextCustom() abort
  let line = getline(v:foldstart)
  let main_text = substitute(line, '^\s*', repeat(' ',indent(v:foldstart)), '')
  let fold_len = v:foldend - v:foldstart 
  let len_text = '['.fold_len.'] '
  if line !~# vimwiki#vars#get_syntaxlocal('rxPreStart')
    let [main_text, spare_len] = s:shorten_text(main_text, 50)
    return substitute(main_text, '^\(.*\)\s*|.*$', '\1', 'g').len_text
  else
    " fold-text for code blocks: use one or two of the starting lines
    let [main_text, spare_len] = s:shorten_text(main_text, 24)
    let line1 = substitute(getline(v:foldstart+1), '^\s*', ' ', '')
    let [content_text, spare_len] = s:shorten_text(line1, spare_len+20)
    if spare_len > s:tolerance && fold_len > 3
      let line2 = substitute(getline(v:foldstart+2), '^\s*', s:newline, '')
      let [more_text, spare_len] = s:shorten_text(line2, spare_len+12)
      let content_text .= more_text
    endif
    return main_text.len_text.content_text
  endif
endfunction

nnoremap <silent><buffer> <Leader>tbl :TaskWikiBufferLoad<CR>
