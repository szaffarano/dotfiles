local M = {}

function M.setup()
  return {
    settings = {
      ansible = {
        ansibleLint = {
          enabled = true,
        },
      },
    },
  }
end

return M
