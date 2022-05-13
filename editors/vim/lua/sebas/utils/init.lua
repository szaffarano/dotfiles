local M = {}

local debug = false

local function dump(o)
  if type(o) == "table" then
    local s = "{ "
    for k, v in pairs(o) do
      if type(k) ~= "number" then
        k = '"' .. k .. '"'
      end
      s = s .. "[" .. k .. "] = " .. dump(v) .. ","
    end
    return s .. "} "
  else
    return tostring(o)
  end
end

-- Use LSP formatter when defined
local function format()
  local clients = vim.lsp.get_active_clients()
  local lsp_format = false

  for _, client in pairs(clients) do
    if debug then
      print(dump(client.server_capabilities))
    end
    if client.server_capabilities.document_formatting then
      lsp_format = true
      break
    end
  end

  if lsp_format then
    if debug then
      print("Using LSP formatter")
    end
    vim.lsp.buf.formatting()
  else
    if debug then
      print("Using Neoformat formatter")
    end
    vim.cmd("Neoformat")
  end
end

M.format = format
M.dump = dump

return M
