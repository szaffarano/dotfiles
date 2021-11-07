require "settings"

local M = {}
function M.setup()
  local on_attach = function(client, _)
    require("jdtls.setup").add_commands()
    require("jdtls").setup_dap()
    require("lspkind").init()

    vim.cmd [[
      nnoremap <A-CR> <Cmd>lua require('jdtls').code_action()<CR>
      vnoremap <A-CR> <Esc><Cmd>lua require('jdtls').code_action(true)<CR>
      nnoremap <leader>r <Cmd>lua require('jdtls').code_action(false, 'refactor')<CR>

      nnoremap <C-A-o> <Cmd>lua require('jdtls').organize_imports()<CR>
      vnoremap <C-A-o> <Cmd>lua require('jdtls').organize_imports()<CR>

      nnoremap crv <Cmd>lua require('jdtls').extract_variable()<CR>
      vnoremap crv <Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>

      nnoremap crc <Cmd>lua require('jdtls').extract_constant()<CR>
      vnoremap crc <Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>

      vnoremap crm <Esc><Cmd>lua require('jdtls').extract_method(true)<CR>

      nnoremap <S-F6> <Esc><Cmd>lua vim.lsp.buf.rename()<CR>
      vnoremap <S-F6> <Esc><Cmd>lua vim.lsp.buf.rename()<CR>

      nnoremap <A-F7> <Esc><Cmd>lua vim.lsp.buf.references()<CR>
      vnoremap <A-F7> <Esc><Cmd>lua vim.lsp.buf.references()<CR>

      nnoremap <leader>df <Cmd>lua require'jdtls'.test_class()<CR>
      nnoremap <leader>dn <Cmd>lua require'jdtls'.test_nearest_method()<CR>

      nnoremap <C-b> <Cmd>lua vim.lsp.buf.definition()<CR>
      nnoremap gd <Cmd>lua vim.lsp.buf.declaration()<CR>
      nnoremap K <Cmd>lua vim.lsp.buf.hover()<CR>
      nnoremap gi <cmd>lua vim.lsp.buf.implementation()<CR>
      nnoremap <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>

      nnoremap <S-F2> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
      nnoremap <F2> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
    ]]

    vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

    if client.resolved_capabilities.document_highlight then
      vim.cmd [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]]
    end
  end

  local root_dir = require("jdtls.setup").find_root {
    ".git",
    "gradlew",
    "mvnw",
    "pom.xml",
    "build.gradle",
  }

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.workspace.configuration = true
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.codeLens = { dynamicRegistration = false }
  capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

  local config = {
    flags = {
      allow_incremental_sync = true,
    },
    filetypes = { "java" },
    capabilities = capabilities,
    on_attach = on_attach,
  }

  config.settings = {
    java = {
      signatureHelp = { enabled = true },
      contentProvider = { preferred = "fernflower" },
      completion = {
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*",
        },
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
        },
      },
    },
  }

  local workspace = HOME .. "/.workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
  config.cmd = { "java-lsp", workspace }
  config.on_attach = on_attach
  config.on_init = function(client, _)
    client.notify("workspace/didChangeConfiguration", { settings = config.settings })
  end

  local extendedClientCapabilities = require("jdtls").extendedClientCapabilities
  extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
  config.init_options = {
    extendedClientCapabilities = extendedClientCapabilities,
  }

  local finders = require "telescope.finders"
  local sorters = require "telescope.sorters"
  local actions = require "telescope.actions"
  local pickers = require "telescope.pickers"
  local action_state = require "telescope.actions.state"

  require("jdtls.ui").pick_one_async = function(items, prompt, label_fn, cb)
    local opts = {}
    pickers.new(opts, {
      prompt_title = prompt,
      finder = finders.new_table {
        results = items,
        entry_maker = function(entry)
          return {
            value = entry,
            display = label_fn(entry),
            ordinal = label_fn(entry),
          }
        end,
      },
      sorter = sorters.get_generic_fuzzy_sorter(),
      attach_mappings = function(prompt_bufnr)
        actions.select_default:replace(function()
          local selection = action_state.get_selected_entry(prompt_bufnr)

          actions.close(prompt_bufnr)

          cb(selection.value)
        end)

        return true
      end,
    }):find()
  end
  require("jdtls").start_or_attach(config)
end

return M
