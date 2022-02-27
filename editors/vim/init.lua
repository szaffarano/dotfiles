if not pcall(require, "impatient") then
  print("impatient plugin is not installed")
end

local bootstrap = require("sebas.bootstrap")() 

vim.g.mapleader = " "

require("sebas.disable_builtins")

require("sebas.plugins").setup(bootstrap)

require("sebas.lsp")
