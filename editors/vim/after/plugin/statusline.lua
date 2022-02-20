local ok, lualine = pcall(require, "lualine")
if not ok then
  print("lualine plugin is not installed")
  return
end

lualine.setup({
  options = {
    theme = "material",
  },
})
