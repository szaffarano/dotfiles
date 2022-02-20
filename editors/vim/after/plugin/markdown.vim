" autowrap markdown files and activates spellcheck
au BufRead,BufNewFile *.md setlocal textwidth=120 formatoptions+=wa spell
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_frontmatter = 1
