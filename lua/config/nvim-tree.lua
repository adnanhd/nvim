-----------------------------------------------------------
-- File explorer: nvim-tree
-- URL: https://github.com/nvim-tree/nvim-tree.lua
-- Keybindings live in core/keymaps.lua.
-----------------------------------------------------------

local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
  return
end

nvim_tree.setup {
  view = {
    width = 34,
    side = "left",
  },
  renderer = {
    group_empty = false,
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
  },
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  git = {
    enable = true,
    ignore = true,
  },
  filters = {
    dotfiles = false,
  },
}
