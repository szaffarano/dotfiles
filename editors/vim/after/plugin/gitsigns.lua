local ok, signs = pcall(require, "gitsigns")
if not ok then
  return
end

signs.setup {}
