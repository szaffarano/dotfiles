local ok, lualine = pcall(require, "lualine")
if not ok then
  print("lualine plugin is not installed")
  return
end

-- thanks TJ for this (https://www.youtube.com/watch?v=jH5PNvJIa6o)
vim.cmd([[highlight WinSeparator guifg=#4e545c guibg=None]])

lualine.setup({
  options = {
    theme = "material",
  },
})

vim.opt.laststatus = 3
