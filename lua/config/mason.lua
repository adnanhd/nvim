require("mason").setup()

require("mason-null-ls").setup({
    ensure_installed = {
        -- Opt to list sources here, when available in mason.
        "black",
        "clang-format",
    },
    automatic_installation = true,
    handlers = {},
})

require("mason-nvim-dap").setup({
    ensure_installed = {
      "python",
    },
    automatic_installation = true,
    handlers = {},
})

