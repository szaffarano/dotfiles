local ok, telescope = pcall(require, "telescope")
if not ok then
  print("Telescope plugin is not installed")
  return
end

telescope.setup({
  defaults = {
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",

    winblend = 20,

    color_devicons = true,

    layout_config = {
      width = 0.95,
      height = 0.85,
      prompt_position = "top",

      horizontal = {
        preview_width = function(_, cols, _)
          if cols > 200 then
            return math.floor(cols * 0.4)
          else
            return math.floor(cols * 0.6)
          end
        end,
      },

      vertical = {
        width = 0.9,
        height = 0.95,
        preview_height = 0.5,
      },

      flex = {
        horizontal = {
          preview_width = 0.9,
        },
      },
    },

    mappings = {
      i = {},
    },

    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
  },

  pickers = {
    find_files = {
      find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
    },
  },

  extensions = {
    frecency = {
      show_scores = true,
      workspaces = {
        ["v"] = vim.env.HOME .. "/.config/nvim",
        ["d"] = vim.env.HOME .. "/.dotfiles",
        ["p"] = vim.env.HOME .. "/projects",
        ["w"] = vim.env.HOME .. "/Documents/wiki",
      },
    },
  },
})

-- register extensions

require("telescope").load_extension("frecency")
require("telescope").load_extension("fzf")
require("telescope").load_extension("packer")
require("telescope").load_extension("file_browser")

-- mappings

local opts = {
  noremap = true,
  silent = false,
}

local builtins = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtins.find_files, opts)
vim.keymap.set("n", "<leader>fg", builtins.live_grep, opts)
vim.keymap.set("n", "<leader>fG", builtins.git_files, opts)
vim.keymap.set("n", "<leader>fb", builtins.buffers, opts)
vim.keymap.set("n", "<leader>fe", telescope.extensions.file_browser.file_browser, opts)
vim.keymap.set("n", "<leader>fr", telescope.extensions.frecency.frecency, opts)
vim.keymap.set("n", "<leader>fR", builtins.registers, opts)
