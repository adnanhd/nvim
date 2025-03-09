local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black", "isort" },
    javascript = { "prettierd", "prettier" },
    json = { "jq" },
    markdown = { "prettierd", "prettier" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    sh = { "shfmt" },
    ["*"] = { "trim_whitespace" }, -- Remove trailing spaces for all files
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    require("conform").format()
  end,
})

