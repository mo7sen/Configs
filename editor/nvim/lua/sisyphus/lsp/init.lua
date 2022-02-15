local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
   return
end

require("sisyphus.lsp.lsp-installer")
require("sisyphus.lsp.handlers").setup()
