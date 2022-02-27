local M = {}

function M.setup(installed_server)
  return {
    python = {
      analysis = {
        diagnosticMode = "workspace",
      },
      venvPath = ".venv",
    },
  }
end

return M
