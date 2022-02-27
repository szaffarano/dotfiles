" relative / hybrid line number switch
augroup toggle_relative_numbers
  autocmd InsertEnter * :setlocal norelativenumber
  autocmd InsertLeave * :setlocal relativenumber
augroup END
