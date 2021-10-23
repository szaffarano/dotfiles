require "settings"

require("telescope").setup {
  defaults = {
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",

    winblend = 20,

    selection_strategy = "reset",
    sorting_strategy = "descending",
    scroll_strategy = "cycle",
    color_devicons = true,
  },

  extensions = {
    fzf = {
      override_generic_sorter = true,
      override_file_sorter = true,
    },

    frecency = {
      workspaces = {
        ["nvim"] = HOME .. "/.config/nvim",
        ["projects"] = HOME .. "/projects",
        ["wiki"] = HOME .. "/Documents/wiki",
      },
    },
  },
}

require("telescope").load_extension "frecency"
require("telescope").load_extension "fzf"

vim.cmd [[
  nnoremap <silent> <leader>ff :Telescope find_files<cr>
  nnoremap <silent> <leader>fG :Telescope git_files<cr>
  nnoremap <silent> <leader>fg :Telescope live_grep<cr>
  nnoremap <silent> <leader>fb :Telescope buffers<cr>
  nnoremap <silent> <leader>ft :Telescope help_tags<cr>
  nnoremap <silent> <leader>fe :Telescope file_browser<cr>
  nnoremap <silent> <leader>fr :Telescope frecency<cr>
  nnoremap <silent> <leader>fR :Telescope registers<cr>

  nnoremap <silent> <leader>fd :lua require('config.telescope').search_dotfiles()<cr>
  nnoremap <silent> <leader>fx :lua require('config.telescope').switch_projects()<cr>
]]

local M = {}

M.search_dotfiles = function()
  require("telescope.builtin").find_files {
    prompt_title = "< VimRC >",
    cwd = HOME .. "/.dotfiles/",
  }
end

M.switch_projects = function()
  require("telescope.builtin").find_files {
    prompt_title = "< Switch Project >",
    cwd = HOME .. "/projects/",
  }
end

return M
