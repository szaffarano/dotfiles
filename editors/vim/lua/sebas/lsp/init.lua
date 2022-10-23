local ok, _ = pcall(require, "lspconfig")
if not ok then
	print("lspconfig not installed")
	return
end

require("sebas.lsp.mason")
require("sebas.lsp.handlers").setup()
