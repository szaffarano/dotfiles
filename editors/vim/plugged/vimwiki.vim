let g:vimwiki_key_mappings = {}
let g:vimwiki_key_mappings.table_mappings = 0

let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_auto_header = 1
let g:vimwiki_list = [
    \ {'path': '~/Documents/wiki/personal/', 'syntax': 'markdown', 'ext': '.md'},
    \ {'path': '~/Documents/wiki/work/', 'syntax': 'markdown', 'ext': '.md'},
    \ {
    \         'path': '~/projects/vimwikiwiki/wiki',
    \         'path_html': '~/projects/vimwikiwiki//docs',
    \         'auto_toc': 1}
\ ]
