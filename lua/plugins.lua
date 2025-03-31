-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: lazy.nvim
-- URL: https://github.com/folke/lazy.nvim

-- For information about installed plugins see the README:
-- neovim-lua/README.md
-- https://github.com/brainfucksec/neovim-lua#readme

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then
  return
end

-- Start setup
lazy.setup({
  spec = {
    -- Colorscheme:
    -- The colorscheme should be available when starting Neovim.
    {
      'navarasu/onedark.nvim',
      lazy = false, -- make sure we load this during startup if it is your main colorscheme
      priority = 1000, -- make sure to load this before all the other start plugins
    },

    -- other colorschemes:
    { 'rebelot/kanagawa.nvim', lazy = false },
    { 'tanvirtin/monokai.nvim', lazy = false },
    { 'https://github.com/rose-pine/neovim', name = 'rose-pine', lazy = false },
    { "nyoom-engineering/oxocarbon.nvim", lazy = false},

    { "https://gitlab.com/bartekjaszczak/distinct-nvim", lazy = false},
    { 'jacoborus/tender.vim', lazy = false},
    {
      'uloco/bluloco.nvim',
      lazy = false,
      priority = 1000,
      dependencies = { 'rktjmp/lush.nvim' },
    },
    { "miikanissi/modus-themes.nvim", lazy = false },
    {
        "zenbones-theme/zenbones.nvim",
        -- Optionally install Lush. Allows for more configuration or extending the colorscheme
        -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
        -- In Vim, compat mode is turned on as Lush only works in Neovim.
        dependencies = "rktjmp/lush.nvim",
        lazy = false,
        priority = 1000,
        -- you can set set configuration options here
        -- config = function()
        --     vim.g.zenbones_darken_comments = 45
        --     vim.cmd.colorscheme('zenbones')
        -- end
    },

    -- Icons
    { 'kyazdani42/nvim-web-devicons', lazy = true },

    -- Dashboard (start screen)
    {
      'goolord/alpha-nvim',
      dependencies = { 'kyazdani42/nvim-web-devicons' },
    },

    -- Git labels
    {
      'lewis6991/gitsigns.nvim',
      lazy = true,
      dependencies = {
        'nvim-lua/plenary.nvim',
        'kyazdani42/nvim-web-devicons',
      },
      config = function()
        require('gitsigns').setup{}
      end
    },

    {
      "NeogitOrg/neogit",
      dependencies = {
        "nvim-lua/plenary.nvim",         -- required
        "sindrets/diffview.nvim",        -- optional - Diff integration

        -- Only one of these is needed.
        "nvim-telescope/telescope.nvim", -- optional
        "ibhagwan/fzf-lua",              -- optional
        "echasnovski/mini.pick",         -- optional
      },
      config = true
    },

		-- Co-Pilot configuration
    {
			"zbirenbaum/copilot.lua",
      -- "github/copilot.vim",
      cmd = "Copilot",
      build = ':Copilot auth',
      event = "InsertEnter",
    },
    {
      "zbirenbaum/copilot-cmp"
    },

    -- Org-Mode and Org-Roam
    {
      "nvim-neorg/neorg",
      lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
      version = "*", -- Pin Neorg to the latest stable release
      config = true,
    },

    -- {
    --   'nvim-orgmode/orgmode',
    --   event = 'VeryLazy',
    --   -- ft = { 'org' },
    --   config = function()
    --     require('orgmode').setup({
    --       org_agenda_files = '~/org/inbox/*.org',
    --       org_default_notes_file = '~/org/mode.d/notes/notes.org',
    --     })
    --   end,
    -- },
    -- {
    --   "chipsenkbeil/org-roam.nvim",
    --   tag = "0.1.1",
    --   dependencies = {
    --     {
    --       "nvim-orgmode/orgmode",
    --       -- tag = "0.3.7",
    --     },
    --   },
    -- },

    -- File explorer
    {
      'kyazdani42/nvim-tree.lua',
      dependencies = { 'kyazdani42/nvim-web-devicons' },
    },
    -- tab bar
    {
        'romgrk/barbar.nvim',
        version = '^1.0.0', -- optional: only update when a new 1.x version is released
        dependencies = {
            'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
            -- animation = true,
            -- insert_at_start = true,
            -- …etc.
        },
    },

    -- Statusline
    {
      -- 'freddiehaddad/feline.nvim',
      'famiu/feline.nvim',
      dependencies = {
        'kyazdani42/nvim-web-devicons',
        'lewis6991/gitsigns.nvim',
      },
    },

    -- Treesitter
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

    -- Indent line
    { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },

    -- Tag viewer
    { 'preservim/tagbar' },

    -- Autopair
    {
      'windwp/nvim-autopairs',
      event = 'InsertEnter',
      config = function()
        require('nvim-autopairs').setup{}
      end
    },

    -- LSP

    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },

    -- Formatter
    {
      "stevearc/conform.nvim",
      lazy = false,
      config = function()
        require("config/conform")
      end,
    },

    -- Autocomplete
    {
      'hrsh7th/nvim-cmp',
      -- load cmp on InsertEnter
      event = 'InsertEnter',
      -- these dependencies will only be loaded when cmp loads
      -- dependencies are always lazy-loaded unless specified otherwise
      dependencies = {
        'L3MON4D3/LuaSnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'saadparwaiz1/cmp_luasnip',
      },
    },

    -- None-ls
    {
      "jay-babu/mason-null-ls.nvim",
      event = { "BufReadPre", "BufNewFile" },
      dependencies = {
        "williamboman/mason.nvim",
        "nvimtools/none-ls.nvim",
      },
    },

    -- Fuzzy finder
    { 'nvim-telescope/telescope.nvim' },

    -- DAP
    {
      "rcarriga/nvim-dap-ui",
      dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio",
        "williamboman/mason.nvim",
        "jay-babu/mason-nvim-dap.nvim",
      }
    }
  },
})
