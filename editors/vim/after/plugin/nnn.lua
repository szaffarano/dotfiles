local cfg = {
  picker = {
    style = {
      width = 0.4,
      height = 0.6,
      xoffset = 0.9,
      yoffset = 0.5,
      border = "rounded",
    },
  },
  mappings = {}, -- TODO
}

require("nnn").setup(cfg)

vim.cmd [[
  tnoremap <leader>n <cmd>NnnExplorer<CR>
  nnoremap <leader>n <cmd>NnnExplorer<CR>
  tnoremap <leader>p <cmd>NnnPicker<CR>
  nnoremap <leader>p <cmd>NnnPicker<CR>
]]
