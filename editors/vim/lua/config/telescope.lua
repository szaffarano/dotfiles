require('settings')

require('telescope').setup {
  defaults = {
 		prompt_prefix = "❯ ",
    selection_caret = "❯ ",

    winblend = 20,

    selection_strategy = "reset",
    sorting_strategy = "descending",
    scroll_strategy = "cycle",
    color_devicons = true,

    file_ignore_patterns = { "parser.c" },
  },

  extensions = {
    frecency = {
      workspaces = {
        ["conf"] = HOME..'/.config/nvim',
        ["projects"] = HOME..'/projects',
        ["wiki"] = HOME..'/Documents/wiki',
      },
    },
  },

}

require"telescope".load_extension("frecency")

local M = {}

M.search_dotfiles = function()
    require("telescope.builtin").find_files(
        {
            prompt_title = "< VimRC >",
            cwd = HOME..'/.dotfiles'
        })
end

M.switch_projects = function()
    require("telescope.builtin").find_files(
        {
            prompt_title = "< Switch Project >",
            cwd = HOME..'/projects/'
        })
end

return M

