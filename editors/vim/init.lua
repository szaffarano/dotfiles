require "settings"

local execute = vim.api.nvim_command

-- bootstrap packer
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  print "Bootstrapping packer"
  vim.fn.system {
    "git",
    "clone",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
end
execute "packadd packer.nvim"
execute "autocmd BufWritePost plugins.lua PackerCompile"

require "plugins"
require "statusline"

require "lsp"
