local opt = vim.opt
local data_dir = vim.fn.stdpath("data")

-- Ignore compiled files
opt.wildignore = "__pycache__"
opt.wildignore = opt.wildignore + { "*.o", "*~", "*.pyc", "*pycache*" }

-- Cool floating window popup menu for completion on command line
opt.pumblend = 17
opt.wildmode = "longest:full"
opt.wildoptions = "pum"

opt.colorcolumn = "80,120"

opt.showmode = false
opt.showcmd = true
opt.cmdheight = 1 -- Height of the command bar
opt.incsearch = true -- Makes search act like search in modern browsers
opt.showmatch = true -- show matching brackets when text indicator is over them
opt.relativenumber = true -- Show line numbers
opt.number = true -- But show the actual number for the line we're on
opt.ignorecase = true -- Ignore case when searching...
opt.smartcase = true -- ... unless there is a capital letter in the query
opt.hidden = true -- I like having buffers stay around
opt.cursorline = true -- Highlight the current line
opt.equalalways = false -- I don't like my windows changing all the time
opt.splitright = true -- Prefer windows splitting to the right
opt.splitbelow = true -- Prefer windows splitting to the bottom
opt.updatetime = 1000 -- Make updates happen faster
opt.hlsearch = true -- I wouldn't use this without my DoNoHL function
opt.scrolloff = 10 -- Make it so there are always ten lines below my cursor
opt.timeoutlen = 500

-- set backup, swap and undo locations
opt.backupdir = data_dir .. "/backup//"
opt.directory = data_dir .. "/swap//"
opt.undodir = data_dir .. "/undo//"
opt.undofile = true -- save  undotrees in files
for _, name in pairs({ "backupdir", "directory", "undodir" }) do
  local dirname = vim.api.nvim_get_option(name)
  if vim.fn.isdirectory(dirname) == 0 then
    vim.fn.mkdir(dirname, "p")
  end
end

-- Tabs
opt.autoindent = true
opt.cindent = true
opt.wrap = true

-- use 2 spaces instead of tab (to replace existing tab use :retab)
-- copy indent from current line when starting a new line
opt.smartindent = true
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.wrap = false

opt.spelllang = "en,es,de,sv"

opt.breakindent = true
opt.showbreak = string.rep(" ", 3) -- Make it so that long lines wrap smartly
opt.linebreak = true

opt.belloff = "all" -- Just turn the dang bell off

opt.clipboard = "unnamed" -- linux secondary clipboard

opt.inccommand = "split"
opt.shada = { "!", "'1000", "<50", "s10", "h" }

opt.mouse = "n"

-- Helpful related items:
--   1. :center, :left, :right
--   2. gw{motion} - Put cursor back after formatting motion.
--
-- TODO: w, {v, b, l}
opt.formatoptions = opt.formatoptions
  - "a" -- Auto formatting is BAD.
  - "t" -- Don't auto format my code. I got linters for that.
  + "c" -- In general, I like it when comments respect textwidth
  + "q" -- Allow formatting comments w/ gq
  - "o" -- O and o, don't continue comments
  + "r" -- But do continue when pressing enter.
  + "n" -- Indent past the formatlistpat, not underneath it.
  + "j" -- Auto-remove comments if possible.
  - "2" -- I'm not in gradeschool anymore

-- set joinspaces
opt.joinspaces = false -- Two spaces and grade school, we're done

-- set fillchars=eob:~
opt.fillchars = { eob = "~" }
