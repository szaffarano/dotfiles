require'compe'.setup({
    enabled = true,
    source = {
        path = true,
        buffer = true,
        calc = true,
        nvim_lsp = true,
        nvim_lua = true,
        vsnip = false,
        ultisnips = true,
        luasnip = true
    }
})

vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()",
                        {silent = true, noremap = true, expr = true})
vim.api.nvim_set_keymap("i", "<CR>", 'compe#confirm("<CR>")',
                        {silent = true, noremap = true, expr = true})
vim.api.nvim_set_keymap("i", "<c-e>", 'compe#close("<c-e>")',
                        {silent = true, noremap = true, expr = true})
