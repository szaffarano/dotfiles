require('settings')

local execute = vim.api.nvim_command
local fn = vim.fn

-- bootstrap packer
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  print("Bootstrapping packer")
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
end
execute 'packadd packer.nvim'
execute 'autocmd BufWritePost plugins.lua PackerCompile'

require('plugins')
require('config')
require('statusline')

require('lsp')

