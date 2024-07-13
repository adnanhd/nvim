local opts = { noremap = true, silent = true }

local tem_ops = { silent = true }

-- shorten function name
local keymap = vim.api.nvim_set_keymap


-- Rempap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Nvimtree
keymap("n", "<leader>nt", ":NvimTreeToggle<cr>", opts)

