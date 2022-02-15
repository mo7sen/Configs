lua << EOF
-- TODO: Check if lsp_config exists

-- Rust
local rust_setup = {
  on_attach = function(client, bufnr)
    require "lsp_signature".on_attach()  -- Note: add in lsp client on-attach
  end
}

require'lspconfig'.rust_analyzer.setup(rust_setup)

-- C/C++ Clangd
local clangd_setup = {
  on_attach = function(client, bufnr)
    require "lsp_signature".on_attach()
  end
}

-- require'lspconfig'.clangd.setup(clangd_setup)
require'lspconfig'.clangd.setup{}

-- CMake
require'lspconfig'.cmake.setup{}
EOF
