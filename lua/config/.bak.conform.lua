local conform = require("conform")
conform.setup({
    formatters_by_Ft = {
        python = { "isort", "black" },
        lua = { "stylua" },
        svelte = { { "prettierd", "prettier" } },
        javascript = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        javascriptreact = { { "prettierd", "prettier" } },
        typescriptreact = { { "prettierd", "prettier" } },
        json = { { "prettierd", "prettier" } },
        graphql = { { "prettierd", "prettier" } },
        java = { "google-java-format" },
        kotlin = { "ktlint" },
        ruby = { "standardrb" },
        markdown = { { "prettierd", "prettier" } },
        erb = { "htmlbeautifier" },
        html = { "htmlbeautifier" },
        bash = { "beautysh" },
        proto = { "buf" },
        rust = { "rustfmt" },
        yaml = { "yamlfix" },
        toml = { "taplo" },
        css = { { "prettierd", "prettier" } },
        scss = { { "prettierd", "prettier" } },
        sh = { { "shellcheck" } },
    },
    format_on_save = {
        -- This options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = "fallback",
    }
})

local opts = { desc = "Format file or range (in visual mode)" }
local format_fn = function()
    conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
    })
end 

vim.keymap.set({ "n", "v" }, "<Leader>l", format_fn, opts)

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
