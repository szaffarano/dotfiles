if not pcall(require, "impatient") then
  print("impatient plugin is not installed")
end

if require("sebas.bootstrap")() then
  return
end

vim.g.mapleader = " "

require("sebas.disable_builtins")
require("sebas.plugins").setup()
require("sebas.lsp")
