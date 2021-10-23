:AnyFoldActivate
let g:anyfold_fold_comments=1
setlocal foldlevel=5
setlocal foldcolumn=3

autocmd BufWritePre (InsertLeave?) <buffer> lua vim.lsp.buf.formatting_sync(nil,500)
autocmd BufWritePre *.go :silent! lua require('go.format').gofmt()
autocmd BufWritePre *.go :silent! lua require('go.format').goimport()
