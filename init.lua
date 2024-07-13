require('options')
require('keymaps')
require('plugins')
require('colorscheme')
require('config.lsp')
require('config.conform')

-- init.lua
vim.cmd('language en_US.utf8')

-- dashboard.nvim reference
print(require("fortune").fortune()) 

local function footer()
    local stats = require("lazy").stats()
    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
    local str = "   " .. stats.count .. " plugins in " .. ms .. "ms"
    return vim.list_extend({ "", str, "" }, require("fortune").fortune(true))
end

