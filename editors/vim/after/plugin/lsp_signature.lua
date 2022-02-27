ok, signature = pcall(require, "lsp_signature")
if not ok then
  print("signature plugin not installed")
  return
end

local cfg = {}

signature.setup(cfg)
