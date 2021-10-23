-- require("go").setup {
  -- auto commands
  -- auto_format = true,
  -- auto_lint = true,
  -- linters: revive, errcheck, staticcheck, golangci-lint
  -- linter = "revive",
  -- lint_prompt_style: qf (quickfix), vt (virtual text)
  -- lint_prompt_style = "vt",
  -- formatter: goimports, gofmt, gofumpt
  -- formatter = "goimports",
  -- test flags: -count=1 will disable cache
  -- test_flags = { "-v" },
  -- test_timeout = "30s",
  -- test_env = {},
  -- show test result with popup window
  -- test_popup = true,
  -- test_popup_width = 80,
  -- test_popup_height = 10,
  -- test open
  -- test_open_cmd = "edit",
  -- struct tags
  -- tags_name = "json",
  -- tags_options = { "json=omitempty" },
  -- tags_transform = "snakecase",
  -- tags_flags = { "-skip-unexported" },
  -- quick type
  -- quick_type_flags = { "--just-types" },
-- }
--
require 'go'.setup({
  goimport = 'gopls', -- if set to 'gopls' will use golsp format
  gofmt = 'gopls', -- if set to gopls will use golsp format
  max_line_len = 120,
  tag_transform = false,
  test_dir = '',
  comment_placeholder = '   ',
  lsp_cfg = true, -- false: use your own lspconfig
  lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
  lsp_on_attach = true, -- use on_attach from go.nvim
  dap_debug = true,
})

local protocol = require'vim.lsp.protocol'
