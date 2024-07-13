local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- File Tree 
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        },
        config = function()
            require("nvim-tree").setup()
        end,
    },
    "tanvirtin/monokai.nvim",
    -- Vscode-like pictograms
    {
        "onsails/lspkind.nvim",
        event = { "VimEnter" },
    },
    -- Auto-completion engine
    {
        "hrsh7th/nvim-cmp",
        dependencies = { "lspkind.nvim" },
        config = function()
            require("config.nvim-cmp")
        end,
    },
    { "hrsh7th/cmp-nvim-lsp", dependencies = { "nvim-cmp" } },
    { "hrsh7th/cmp-buffer", dependencies = { "nvim-cmp" } }, -- buffer auto-completion
    { "hrsh7th/cmp-path", dependencies = { "nvim-cmp" } }, -- path auto-completion
    { "hrsh7th/cmp-cmdline", dependencies = { "nvim-cmp" } }, -- cmdline auto-completion
    -- Code snippet engine
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp"
    },
    -- LSP manager
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    -- Formatter
    {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
    },
    -- CoPilot configuration
    {
        "zbirenbaum/copilot.lua",
        -- "github/copilot.vim",
        cmd = "Copilot",
        build = ':Copilot auth',
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = {
                    auto_trigger = true,
                    debounce = 100,
                    keymap = {
                        accept = "<C-l>",
                        dismiss = "<Leader>ce",
                        suggest = "<C-h>",
                    },
                }
            })
        end
    },
    {
        "zbirenbaum/copilot-cmp",
        config = function()
            require("copilot_cmp").setup({})
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function () 
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "c", "org", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
                -- ignore_install = { "org" },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },  
            })
        end
    },
    {
        "chipsenkbeil/org-roam.nvim",
        tag = "0.1.0",
        dependencies = {
            {
                "nvim-orgmode/orgmode",
                tag = "0.3.4",
                event = 'VeryLazy',
                ft = { 'org' },
                config = function()
                    -- Setup orgmode
                    require('orgmode').setup({
                        org_agenda_files = { '~/Dropbox/org/**/*.org', '~/.local/share/org/**/*.org' },
                        org_default_notes_file = '~/.local/share/org/refile.org',
                        org_todo_keywords = {'TODO', 'WAITING', '|', 'DONE', 'DELEGATED'},
                        org_todo_keyword_faces = {
                            WAITING = ':foreground blue :weight bold',
                            DELEGATED = ':background #FFFFFF :slant italic :underline on',
                            TODO = ':background #000000 :foreground red', -- overrides builtin color for `TODO` keyword
                        },
                    })
                end,
            },
        },
        config = function()
            require("org-roam").setup({
                directory = "~/.local/share/org/",
                -- optional
            })
        end

    },
    {
        "fecet/fortune.nvim",
    }
})
