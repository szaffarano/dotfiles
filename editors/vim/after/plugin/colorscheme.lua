local ok, material = pcall(require, "material")
if not ok then
  print("material plugin is not installed")
  return
end

vim.opt.termguicolors = true

vim.g.material_style = "oceanic"

material.setup({
  italics = {
    comments = true,
  },
  lualine_style = "stealth",
})

vim.cmd("colorscheme material")
