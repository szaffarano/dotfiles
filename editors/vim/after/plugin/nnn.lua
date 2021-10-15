local function copy_to_clipboard(files)
  files = table.concat(files, "\n")
  vim.fn.setreg("+", files)
  print(files:gsub("\n", ", ") .. " copied to register")
end

local function cd_to_path(files)
  local dir = files[1]:match ".*/"
  local read = io.open(dir, "r")
  if read ~= nil then
    io.close(read)
    vim.fn.execute("cd " .. dir)
    print("working directory changed to: " .. dir)
  end
end

local mappings = {
  { "<C-t>", "tabedit" },
  { "<C-s>", "split" },
  { "<C-v>", "vsplit" },
  { "<C-w>", cd_to_path },
  { "<C-y>", { copy_to_clipboard, quit = false } },
  { "<S-y>", { copy_to_clipboard, quit = true } },
}

local cfg = {
  picker = {
    style = {
      width = 0.4,
      height = 0.6,
      xoffset = 0.9,
      yoffset = 0.5,
      border = "rounded",
    },
  },
  mappings = mappings,
}

require("nnn").setup(cfg)

vim.cmd [[
  tnoremap <leader>n <cmd>NnnExplorer<CR>
  nnoremap <leader>n <cmd>NnnExplorer<CR>
  tnoremap <leader>p <cmd>NnnPicker<CR>
  nnoremap <leader>p <cmd>NnnPicker<CR>
]]
