nnoremap <silent> <leader>ff :Telescope find_files<cr>
nnoremap <silent> <leader>fG :Telescope git_files<cr>
nnoremap <silent> <leader>fg :Telescope live_grep<cr>
nnoremap <silent> <leader>fb :Telescope buffers<cr>
nnoremap <silent> <leader>ft :Telescope help_tags<cr>
nnoremap <silent> <leader>fe :Telescope file_browser<cr>
nnoremap <silent> <leader>fr :Telescope frecency<cr>
nnoremap <silent> <leader>fR :Telescope registers<cr>

nnoremap <silent> <leader>fd :lua require('config.telescope').search_dotfiles()<cr>
nnoremap <silent> <leader>fx :lua require('config.telescope').switch_projects()<cr>
