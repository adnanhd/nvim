-- Import Lua modules
require('plugins')
require('core/autocmds')
require('core/keymaps')
require('core/colors')
require('core/statusline')
require('core/options')
require('config/lspconfig')
require('config/nvim-tree')
require('config/indent-blankline')
require('config/nvim-cmp')
require('config/nvim-treesitter')
require('config/alpha-nvim')
require('config/telescope')
require('config/mason')
require('config/none-ls')
require('config/dap')
require('config/copilot')
require('config/org')

-- init.lua
vim.cmd('language en_US.utf8')

-- dashboard.nvim reference
-- print(require("fortune").fortune())
