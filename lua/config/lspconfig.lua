-----------------------------------------------------------
-- LSP configuration (native vim.lsp API, Neovim 0.11+)
-----------------------------------------------------------
-- Server definitions ship with nvim-lspconfig (lsp/<name>.lua); we only
-- add completion capabilities, attach keymaps, and enable the servers.

local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if cmp_ok then
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

-- Defaults applied to every server
vim.lsp.config('*', {
  capabilities = capabilities,
})

-- Buffer-local keymaps once a server attaches
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspAttach', { clear = true }),
  callback = function(ev)
    local opts = { noremap = true, silent = true, buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, opts)
  end,
})

-- Diagnostics
vim.diagnostic.config({
  virtual_text = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = 'minimal',
    border = 'rounded',
    source = true,
    header = '',
    prefix = '',
  },
})

local dopts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, dopts)
vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1 }) end, dopts)
vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1 }) end, dopts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, dopts)

-- Enable servers (binaries installed via mason / mason-lspconfig)
vim.lsp.enable({ 'pylsp', 'clangd', 'lua_ls' })
