require('settings')

local nvim_lsp = require('lspconfig')

local custom_init = function(client)
  client.config.flags = client.config.flags or {}
  client.config.flags.allow_incremental_sync = true
end

-- diagnostic config
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = false,
        virtual_text = {spacing = 4, prefix = "■"},
        signs = true,
        update_in_insert = false,
    }
)

-- signs
vim.fn.sign_define("LspDiagnosticsSignError", {text="✗", texthl="LspDiagnosticsError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text="⚠", texthl="LspDiagnosticsWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text="ⓘ", texthl="LspDiagnosticsInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text="✓", texthl="LspDiagnosticsHint"})

local updated_capabilities = vim.lsp.protocol.make_client_capabilities()
updated_capabilities.textDocument.completion.completionItem.snippetSupport = true

local custom_attach = function(client, bufnr)
    vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

    local nmap = function(k, v)
        local o = {noremap=true, silent=true}
        vim.api.nvim_buf_set_keymap(0, 'n', k, v, o)
    end
    local imap = function(k, v)
        local o = {noremap=true, silent=true}
        vim.api.nvim_buf_set_keymap(0, 'i', k, v, o)
    end
    nmap('ca', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    nmap('gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
    nmap('gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
    nmap('gr', '<cmd>lua vim.lsp.buf.references()<cr>')
    nmap('K', '<cmd>lua vim.lsp.buf.hover()<cr>')
    nmap('<c-K>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
    imap('<c-K>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
    nmap('<F2>', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>')
    nmap('<S-F2>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>')

    -- Set autocommands conditional on server capabilities
    if client.resolved_capabilities.document_highlight then
        vim.cmd [[
            augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]]
    end

    vim.api.nvim_set_current_dir(client.config.root_dir)

    require'lsp_signature'.on_attach({
      bind = true,
      handler_opts = {
        border = "single"
      }
    })
end

nvim_lsp.gopls.setup({
	on_attach = custom_attach,
	on_init = custom_init,
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
})

nvim_lsp.java_language_server.setup{
  on_attach = custom_attach,
  on_init = custom_init,
  cmd = {HOME .. '/projects/java-language-server/dist/lang_server_linux.sh'}
}

nvim_lsp.kotlin_language_server.setup{
  on_attach = custom_attach,
  on_init = custom_init,
  cmd = {HOME .. '/projects/kotlin-language-server/server/build/install/server/bin/kotlin-language-server'}
}

nvim_lsp.pylsp.setup{
  on_attach = custom_attach,
  on_init = custom_init,
  settings = {
    pylsp = {
        plugins = {
            yapf = {enabled = true};
            isort = {enabled = true};
            mypy = {enabled = true};
        }
    },
  },
}

nvim_lsp.vimls.setup{
  on_attach = custom_attach,
  on_init = custom_init,
}

nvim_lsp.bashls.setup{
  on_attach = custom_attach,
  on_init = custom_init,
  filetypes = { 'sh', 'zsh' }
}

nvim_lsp.rust_analyzer.setup{
  on_attach = custom_attach,
  on_init = custom_init,
  cmd = { HOME .. '/projects/rust-analyzer/target/debug/rust-analyzer' }
}

nvim_lsp.terraformls.setup{
  on_attach = custom_attach,
  on_init = custom_init,
  filetypes = { "terraform", "hcl", "tf" }
}


-- Lua LSP
local sumneko_root_path = HOME .. '/projects/lua-language-server'
local sumneko_binary = sumneko_root_path .. '/bin/Linux/lua-language-server'
nvim_lsp.sumneko_lua.setup {
  on_attach = custom_attach,
  on_init = custom_init,
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
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

nvim_lsp.jsonls.setup{
  on_attach = custom_attach,
  on_init = custom_init,
}

nvim_lsp.yamlls.setup{}

nvim_lsp.dockerls.setup{}

nvim_lsp.tsserver.setup{}

-- golang
function GoImports(timeoutms)
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}

    local method = "textDocument/codeAction"
    local result = vim.lsp.buf_request_sync(0, method, params, timeoutms)
    for _, res in pairs(result or {}) do
        for _, r in pairs(res.result or {}) do
            if r.edit then
                vim.lsp.util.apply_workspace_edit(r.edit)
            else
                vim.lsp.buf.execute_command(r.command)
            end
        end
    end

    vim.lsp.buf.formatting_sync(nil, timeoutms)
end
vim.api.nvim_command("au BufWritePre *.go lua GoImports(10000)")

require('symbols-outline').setup({
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = true,
    position = 'right',
    show_numbers = false,
    show_relative_numbers = false,
    show_symbol_details = true,
    keymaps = {
        close = "<Esc>",
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        rename_symbol = "r",
        code_actions = "a",
    },
    lsp_blacklist = {},
})
