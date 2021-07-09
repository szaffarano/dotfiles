local opt = vim.opt
local fn = vim.fn

DATA           = fn.stdpath('data')
CONFIG         = fn.stdpath('config')
PLUGGED_DATA   = DATA .. '/plugged'
PLUGGED_CONFIG = CONFIG .. '/plugged'
HOME           = fn.expand("$HOME")

-- use 2 spaces instead of tab (to replace existing tab use :retab)
-- copy indent from current line when starting a new line
opt.autoindent  = true
opt.smartindent = true
opt.expandtab   = true
opt.tabstop     = 2
opt.softtabstop = 2
opt.shiftwidth  = 2
opt.wrap        = false

-- autosave when lost focus
vim.cmd [[ autocmd BufLeave, FocusLost * silent! wall ]]

opt.spelllang="en,es,de"

-- set 80 and 120 column borders for good coding style
opt.colorcolumn="80,120"

opt.hidden = true

opt.relativenumber = true
opt.number         = true

opt.ignorecase = true
opt.smartcase  = true
opt.incsearch  = true
opt.hlsearch   = true

opt.mouse = 'a'

opt.scrolloff = 10

opt.splitbelow = true
opt.splitright = true

opt.wildmode = "list:longest"

-- Cool floating window popup menu for completion on command line
opt.pumblend = 17

opt.wildmode = opt.wildmode - "list"
opt.wildmode = opt.wildmode + { "longest", "full" }

-- set backup, swap and undo locations
opt.backupdir = DATA .. '/backup//'
opt.directory = DATA .. '/swap//'
opt.undodir   = DATA .. '/undo//'
opt.undofile  = true -- save  undotrees in files
for _, name in pairs({'backupdir', 'directory', 'undodir'}) do
  local dirname = vim.api.nvim_get_option(name)
  if vim.fn.isdirectory(dirname) == 0 then
    vim.fn.mkdir(dirname, 'p')
  end
end

vim.g.mapleader = ' '

vim.g.gruvbox_material_background                = 'hard'
vim.g.gruvbox_material_diagnostic_text_highlight = 1
vim.g.gruvbox_material_diagnostic_virtual_text   = 'colored'

-- Highlight on yank
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

-- relative / hybrid line number switch
vim.api.nvim_exec([[
augroup toggle_relative_numbers
  autocmd InsertEnter * :setlocal norelativenumber
  autocmd InsertLeave * :setlocal relativenumber
augroup END
]], false)
