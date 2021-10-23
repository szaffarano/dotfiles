require "settings"

local has_lsp, lspconfig = pcall(require, "lspconfig")
if not has_lsp then
  return
end
local lspconfig_util = require "lspconfig.util"

-- diagnostic config
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = false,
  virtual_text = { spacing = 4, prefix = "■" },
  signs = true,
  update_in_insert = false,
})

-- signs
vim.fn.sign_define("DiagnosticSignError", {
  text = "✗",
  texthl = "DiagnosticSignError",
})

vim.fn.sign_define("DiagnosticSignWarn", {
  text = "⚠",
  texthl = "DiagnosticSignWarn",
})

vim.fn.sign_define("DiagnosticSignInfo", {
  text = "ⓘ",
  texthl = "DiagnosticSignInfo",
})

vim.fn.sign_define("DiagnosticSignHint", {
  text = "✓",
  texthl = "DiagnosticSignHint",
})

local updated_capabilities = vim.lsp.protocol.make_client_capabilities()
updated_capabilities.textDocument.completion.completionItem.snippetSupport = true
updated_capabilities.textDocument.codeLens = { dynamicRegistration = false }
updated_capabilities = require("cmp_nvim_lsp").update_capabilities(updated_capabilities)

local sumneko_root_path = HOME .. "/projects/lua-language-server"
local java_lsp_root_path = HOME .. "/projects/java-language-server"
local kotlink_lsp_root_path = HOME .. "/projects/kotlin-language-server"

local sumneko_binary = sumneko_root_path .. "/bin/Linux/lua-language-server"
local java_lsp_binary = java_lsp_root_path .. "/dist/lang_server_linux.sh"
local kotlink_lsp_binary = kotlink_lsp_root_path .. "/server/build/install/server/bin/kotlin-language-server"

local filetype_attach = setmetatable({}, {
  __index = function()
    return function() end
  end,
})

local custom_init = function(client)
  client.config.flags = client.config.flags or {}
  client.config.flags.allow_incremental_sync = true
end

local custom_attach = function(client)
  local filetype = vim.api.nvim_buf_get_option(0, "filetype")

  local nmap = function(k, v)
    local o = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(0, "n", k, v, o)
  end
  local imap = function(k, v)
    local o = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(0, "i", k, v, o)
  end

  imap("<c-s>", "<cmd> lua vim.lsp.buf.signature_help()<cr>")
  nmap("<space>cr", "<cmd> lua vim.lsp.buf.rename ()<cr>")
  nmap("<a-ins>", "<cmd>lua vim.lsp.buf.code_action ()<cr>")
  nmap("<c-b>", "<cmd>lua vim.lsp.buf.definition ()<cr>")
  nmap("gD", "<cmd>lua vim.lsp.buf.declaration ()<cr>")
  nmap("gT", "<cmd>lua vim.lsp.buf.type_definition ()<cr>")
  nmap("<a-F7>", "<cmd>lua vim.lsp.buf.references ()<cr>")
  nmap("K", "<cmd>lua vim.lsp.buf.hover ()<cr>")
  nmap("<a-ins>", "<cmd>lua vim.lsp.buf.code_action ()<cr>")
  nmap("<c-K>", "<cmd>lua vim.lsp.buf.signature_help ()<cr>")
  imap("<c-K>", "<cmd>lua vim.lsp.buf.signature_help ()<cr>")
  nmap("<F2>", "<cmd>lua vim.lsp.diagnostic.goto_next ()<cr>")
  nmap("<S-F2>", "<cmd>lua vim.lsp.diagnostic.goto_prev ()<cr>")
  nmap("<S-F6>", "<cmd>lua vim.lsp.buf.rename ()<cr>")

  vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.cmd [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]]
  end

  if client.resolved_capabilities.code_lens then
    vim.cmd [[
      augroup lsp_document_codelens
        au! * <buffer>
        autocmd BufWritePost,CursorHold <buffer> lua vim.lsp.codelens.refresh()
      augroup END
    ]]
  end

  -- Attach any filetype specific options to the client
  filetype_attach[filetype](client)
end

local servers = {
  gdscript = true,
  graphql = true,
  html = true,
  pyright = true,
  vimls = true,
  yamlls = true,
  jsonls = true,
  dockerls = true,
  rust_analyzer = true,

  gopls = {
    root_dir = function(fname)
      local Path = require "plenary.path"

      local absolute_cwd = Path:new(vim.loop.cwd()):absolute()
      local absolute_fname = Path:new(fname):absolute()

      if string.find(absolute_cwd, "/cmd/", 1, true) and string.find(absolute_fname, absolute_cwd, 1, true) then
        return absolute_cwd
      end

      return lspconfig_util.root_pattern("go.mod", ".git")(fname)
    end,

    settings = {
      gopls = {
        codelenses = { test = true },
      },
    },

    flags = {
      debounce_text_changes = 200,
    },
  },

  java_language_server = {
    cmd = { java_lsp_binary },
  },

  kotlin_language_server = {
    cmd = { kotlink_lsp_binary },
  },

  bashls = {
    filetypes = { "sh", "zsh" },
  },

  terraformls = {
    filetypes = { "terraform", "hcl", "tf" },
  },

  cmake = (1 == vim.fn.executable "cmake-language-server"),

  clangd = {
    cmd = {
      "clangd",
      "--background-index",
      "--suggest-missing-includes",
      "--clang-tidy",
      "--header-insertion=iwyu",
    },
  },

  tsserver = {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    },
  },

  sumneko_lua = {
    cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = "LuaJIT",
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { "vim" },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  },
}

local setup_server = function(server, config)
  if not config then
    return
  end

  if type(config) ~= "table" then
    config = {}
  end

  config = vim.tbl_deep_extend("force", {
    on_init = custom_init,
    on_attach = custom_attach,
    capabilities = updated_capabilities,
    flags = {
      debounce_text_changes = 50,
    },
  }, config)

  lspconfig[server].setup(config)
end

for server, config in pairs(servers) do
  setup_server(server, config)
end

return {
  on_init = custom_init,
  on_attach = custom_attach,
  capabilities = updated_capabilities,
}
