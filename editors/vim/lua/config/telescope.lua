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
  },

  extensions = {
    fzf = {
      override_generic_sorter = true,
      override_file_sorter = true,
    },

    frecency = {
      workspaces = {
        ["nvim"] = HOME..'/.config/nvim',
        ["projects"] = HOME..'/projects',
        ["wiki"] = HOME..'/Documents/wiki',
      },
    },
  },

}

require'telescope'.load_extension("frecency")
require'telescope'.load_extension('fzf')

local M = {}

M.search_dotfiles = function()
    require("telescope.builtin").find_files(
        {
            prompt_title = "< VimRC >",
            cwd = HOME..'/.dotfiles/'
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

