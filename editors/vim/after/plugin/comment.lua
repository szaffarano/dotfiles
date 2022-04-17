local ok, comment = pcall(require, "Comment")
if not ok then
  print("comment plugin is not installed")
  return
end

comment.setup()
