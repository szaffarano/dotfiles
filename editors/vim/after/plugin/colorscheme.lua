local ok, lualine = pcall(require, "lualine")
if not ok then
	print("lualine plugin is not installed")
	return
end

vim.o.termguicolors = true
vim.cmd([[ colorscheme onedark ]])

-- Set lualine as statusline
-- See `:help lualine.txt`
lualine.setup({
	options = {
		icons_enabled = false,
		theme = "onedark",
		component_separators = "|",
		section_separators = "",
	},
})
