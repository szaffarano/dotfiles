vim.g.shfmt_opt = "-ci"

vim.api.nvim_set_keymap("n", "<C-l>", ":Neoformat<CR>", { silent = true, noremap = true})
