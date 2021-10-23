require("go").setup {
  goimport = "gopls",
  gofmt = "gopls",
  max_line_len = 120,
  tag_transform = false,
  test_dir = "",
  comment_placeholder = "   ",
  dap_debug = true,
}
