local utils = require("sebas.utils")

vim.g.shfmt_opt = "-ci"

vim.keymap.set({ "n", "i" }, "<C-A-l>", utils.format, { silent = true, noremap = true })
