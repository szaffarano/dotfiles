local M = {}

local avoid_lsp_formatting = {
  tsserver = true,
  jsonls = true,
  sumneko_lua = true,
}

local references = vim.lsp.buf.references
local ok, telescope_builtins = pcall(require, "telescope.builtin")
if ok then
  references = telescope_builtins.lsp_references
end

-- stylua: ignore start
local lsp_keymappings = {
  ["K"]         = vim.lsp.buf.hover,
  ["gD"]        = vim.lsp.buf.declaration,
  ["gd"]        = vim.lsp.buf.definition,
  ["gi"]        = vim.lsp.buf.implementation,
  ["gr"]        = references,
  ["<C-k>"]     = vim.lsp.buf.signature_help,
  ["[d"]        = vim.diagnostic.goto_prev,
  ["]d"]        = vim.diagnostic.goto_next,
  ["<leader>a"] = vim.lsp.buf.code_action,
  ["<leader>r"] = vim.lsp.buf.rename,
}
-- stylua: ignore end

function M.lsp_diagnostics()
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    underline = false,
    signs = true,
    update_in_insert = false,
  })

  local on_references = vim.lsp.handlers["textDocument/references"]
  vim.lsp.handlers["textDocument/references"] = vim.lsp.with(on_references, { loclist = true, virtual_text = true })

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

function M.lsp_highlight(client)
  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
        hi LspReferenceRead cterm=bold ctermbg=red guibg=#282f45
        hi LspReferenceText cterm=bold ctermbg=red guibg=#282f45
        hi LspReferenceWrite cterm=bold ctermbg=red guibg=#282f45
        augroup lsp_document_highlight
          autocmd! * <buffer>
          autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]],
      false
    )
  end
end

function M.lsp_config(client, bufnr)
  require("lsp_signature").on_attach({
    bind = true,
    handler_opts = { border = "single" },
  })

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(...)
  end

  buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Key mappings
  for mapping, cmd in pairs(lsp_keymappings) do
    vim.keymap.set("n", mapping, cmd, { noremap = true, silent = false })
  end

  -- LSP and DAP menu
  -- local whichkey = require("config.whichkey")
  -- whichkey.register_lsp(client)

  if avoid_lsp_formatting[client.name] ~= nil then
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
  end

  vim.cmd([[
    augroup lsp_buf_format
      au! BufWritePre <buffer>
      autocmd BufWritePre <buffer> :lua require('sebas.utils').format()
    augroup END
  ]])
end

function M.lsp_init(client)
  client.config.flags = client.config.flags or {}
  client.config.flags.allow_incremental_sync = true
end

function M.lsp_exit()
  -- LSP exit
end

function M.lsp_attach(client, bufnr)
  M.lsp_config(client, bufnr)
  M.lsp_highlight(client)
  M.lsp_diagnostics()
end

function M.get_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  -- for nvim-cmp
  capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

  -- Code actions
  capabilities.textDocument.codeAction = {
    dynamicRegistration = true,
    codeActionLiteralSupport = {
      codeActionKind = {
        valueSet = (function()
          local res = vim.tbl_values(vim.lsp.protocol.CodeActionKind)
          table.sort(res)
          return res
        end)(),
      },
    },
  }

  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = { "documentation", "detail", "additionalTextEdits" },
  }
  capabilities.experimental = {}
  capabilities.experimental.hoverActions = true

  return capabilities
end

return M
