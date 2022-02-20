local M = {}

local function setup_servers()
  local lsp_installer = require("nvim-lsp-installer")

  -- TODO
  -- require("config.lsp.null-ls").setup()

  lsp_installer.on_server_ready(function(server)
    local has_custom_config, server_config = pcall(require, "sebas.lsp." .. server.name)
    local lsputils = require("sebas.lsp.utils")

    local config = {
      on_attach = lsputils.lsp_attach,
      capabilities = lsputils.get_capabilities(),
      on_init = lsputils.lsp_init,
      on_exit = lsputils.lsp_exit,
    }

    if has_custom_config then
      local custom_config = server_config.setup(server)
      if custom_config then
        config = vim.tbl_deep_extend("force", config, custom_config)
      end
    end

    server:setup(config)
  end)
end

function M.setup()
  setup_servers()
end

return M
