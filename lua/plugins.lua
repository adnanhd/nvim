-----------------------------------------------------------
-- Plugin manager: lazy.nvim
-- URL: https://github.com/folke/lazy.nvim
-----------------------------------------------------------

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then
  return
end

lazy.setup({
  spec = {
    -- Colorscheme
    {
      'rose-pine/neovim',
      name = 'rose-pine',
      lazy = false,
      priority = 1000,
    },

    -- Icons + common Lua deps
    { 'nvim-tree/nvim-web-devicons', lazy = true },
    { 'nvim-lua/plenary.nvim', lazy = true },

    -- Git signs in the gutter
    {
      'lewis6991/gitsigns.nvim',
      event = { 'BufReadPre', 'BufNewFile' },
      config = function() require('gitsigns').setup{} end,
    },

    -- File explorer
    {
      'nvim-tree/nvim-tree.lua',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
    },

    -- Statusline
    {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
    },

    -- Treesitter
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

    -- Org-mode reading: syntax highlighting + folding (no agenda/capture)
    {
      'nvim-orgmode/orgmode',
      ft = { 'org' },
      config = function()
        require('orgmode').setup({})
      end,
    },

    -- Indent guides
    { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },

    -- Autopairs
    {
      'windwp/nvim-autopairs',
      event = 'InsertEnter',
      config = function() require('nvim-autopairs').setup{} end,
    },

    -- LSP
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'neovim/nvim-lspconfig' },

    -- Formatter
    {
      'stevearc/conform.nvim',
      event = { 'BufWritePre' },
      config = function() require('config/conform') end,
    },

    -- Autocomplete
    {
      'hrsh7th/nvim-cmp',
      event = 'InsertEnter',
      dependencies = {
        'L3MON4D3/LuaSnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'saadparwaiz1/cmp_luasnip',
      },
    },

    -- Fuzzy finder
    {
      'nvim-telescope/telescope.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' },
    },

    -- Claude Code (in-editor terminal + send/diff; needs the `claude` CLI)
    {
      'coder/claudecode.nvim',
      config = true,
      cmd = {
        'ClaudeCode', 'ClaudeCodeFocus', 'ClaudeCodeSend', 'ClaudeCodeAdd',
        'ClaudeCodeDiffAccept', 'ClaudeCodeDiffDeny',
      },
      keys = {
        { '<leader>ac', '<cmd>ClaudeCode<cr>', desc = 'Claude Code toggle' },
        { '<leader>af', '<cmd>ClaudeCodeFocus<cr>', desc = 'Claude Code focus' },
        { '<leader>ab', '<cmd>ClaudeCodeAdd %<cr>', desc = 'Add buffer to Claude' },
        { '<leader>as', '<cmd>ClaudeCodeSend<cr>', mode = 'v', desc = 'Send selection to Claude' },
        { '<leader>aa', '<cmd>ClaudeCodeDiffAccept<cr>', desc = 'Accept Claude diff' },
        { '<leader>ad', '<cmd>ClaudeCodeDiffDeny<cr>', desc = 'Deny Claude diff' },
      },
    },
  },
})
