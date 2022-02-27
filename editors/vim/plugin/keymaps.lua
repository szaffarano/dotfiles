vim.keymap.set("i", "jk", "<Esc>", { noremap = true })
vim.keymap.set("i", "kj", "<Esc>", { noremap = true })

vim.keymap.set("i", "<Up>", "<Nop>", { noremap = true })
vim.keymap.set("i", "<Down>", "<Nop>", { noremap = true })
vim.keymap.set("i", "<Left>", "<Nop>", { noremap = true })
vim.keymap.set("i", "<Right>", "<Nop>", { noremap = true })

vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

vim.keymap.set("n", "<A-h>", ":vertical resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-l>", ":vertical resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-j>", ":resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-k>", ":resize +2<CR>", { noremap = true, silent = true })

-- system clipboard
vim.keymap.set("v", "<Leader>y", "+y")
vim.keymap.set("v", "<Leader>d", "+d")
vim.keymap.set({ "v", "n" }, "<Leader>p", "+p")
vim.keymap.set({ "v", "n" }, "<Leader>p", "+p")

vim.keymap.set("v", "p", '"_dP', { noremap = true, silent = true })

vim.keymap.set("n", "<Esc>", "<Cmd>noh<Cr>", { noremap = true, silent = true })

vim.keymap.set("n", "<Leader>y", "+yy")

-- move between tabs and buffers
vim.keymap.set("n", "<C-Left>", "<Cmd>tabprev<CR> <Cmd>redraw!<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<C-Right>", "<Cmd>tabnext<CR> <Cmd>redraw!<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<Left>", "<Cmd>bp<CR> <Cmd>redraw!<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<Right>", "<Cmd>bn<CR> <Cmd>redraw!<CR>", { silent = true, noremap = true })

-- toggles the paste mode
vim.keymap.set("n", "<C-p>", "<Cmd>set paste!<CR>")

-- disable annoying ex mode
vim.keymap.set("n", "Q", "<Nop>", { noremap = true })

-- reload vimrc configuration file
vim.keymap.set("n", "<Leader>vr", "<Cmd>source $MYVIMRC<CR>", { noremap = true })

-- toggle spelling
vim.keymap.set({ "n", "i" }, "<F12>", "<Cmd>set spell!<cr>", { silent = true, noremap = true })

-- go to previous buffer
vim.keymap.set("n", "<leader><Leader>", "<C-^>", { silent = true, noremap = true })

-- close current buffer
vim.keymap.set("n", "<leader>d", "<Cmd>bdel<CR>", { silent = true, noremap = true })
