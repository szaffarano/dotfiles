let g:clap_theme = 'material_design_dark'

let g:clap_open_action = { 'ctrl-t': 'tab split', 'ctrl-x': 'split', 'ctrl-v': 'vsplit' }

let g:clap_provider_alias = {'f:': 'files'}

" List buffers
nnoremap <silent> <leader>bb :Clap buffers<CR>

" List registers
nnoremap <silent> <leader>rr :Clap registers<CR>

" List commands
nnoremap <silent> <leader>c :Clap command<CR>
