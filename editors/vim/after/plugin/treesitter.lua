local ok, ts_configs = pcall(require, "nvim-treesitter.configs")
if not ok then
  print("treesitter plugin is not installed")
  return
end

ts_configs.setup({
  ensure_installed = "maintained",

  highlight = {
    enable = true,
  },
})
