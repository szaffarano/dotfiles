local sumneko_root_path = vim.env.HOME .. "/projects/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/Linux/lua-language-server"

local servers = {}

servers["pyright"] = {
  settings = {
    python = {
      analysis = {
        diagnosticMode = "workspace",
      },
      venvPath = ".venv",
    },
  },
}

servers["bashls"] = {
  filetypes = { "sh", "zsh" },
}

servers["terraformls"] = {
  filetypes = { "terraform", "hcl", "tf" },
}

servers["sumneko_lua"] = {
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
}

return servers
