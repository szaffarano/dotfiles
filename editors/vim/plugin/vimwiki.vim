let g:vimwiki_key_mappings = {}

let g:vimwiki_key_mappings.table_mappings = 0

" let g:vimwiki_global_ext = 0
let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_auto_header = 1
let g:vimwiki_list = [
    \ {'path': '~/Documents/wiki/personal/', 'syntax': 'markdown', 'ext': '.md', 'auto_tags': 1},
    \ {'path': '~/Documents/wiki/work/', 'syntax': 'markdown', 'ext': '.md', 'auto_tags': 1}
\ ]

let g:vimwiki_folding='custom'

set foldmethod=syntax
set foldlevelstart=1
set foldlevelstart=20

" inserts a templet when create a new diary buffer
augroup vimwiki_diary
  autocmd!
  autocmd BufNewFile */wiki/*/diary/*.md :silent 
    \ 0r !~/.local/bin/tasks-status-template.py '%'
augroup END
