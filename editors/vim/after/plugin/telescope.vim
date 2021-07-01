nnoremap <silent> <leader>fff :Telescope find_files<CR>
nnoremap <silent> <leader>ff :Telescope git_files<CR>
nnoremap <silent> <leader>fg :Telescope live_grep<cr>
nnoremap <silent> <leader>fb :Telescope buffers<cr>
nnoremap <silent> <leader>ft :Telescope help_tags<cr>
nnoremap <silent> <leader>fe :Telescope file_browser<cr>
nnoremap <silent> <leader>fr :Telescope frecency<CR>

nnoremap <silent> <leader>fd :lua require('config.telescope').search_dotfiles()<CR>
nnoremap <silent> <leader>fx :lua require('config.telescope').switch_projects()<CR>
