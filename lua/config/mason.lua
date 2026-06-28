-----------------------------------------------------------
-- LSP installer: mason + mason-lspconfig
-----------------------------------------------------------

require("mason").setup()

-- No-node servers (node/npm not installed, so pyright/bashls/web are skipped).
require("mason-lspconfig").setup({
  ensure_installed = {
    "pylsp", "clangd", "lua_ls",
  },
})
