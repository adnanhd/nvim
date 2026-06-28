-----------------------------------------------------------
-- Statusline: lualine
-- URL: https://github.com/nvim-lualine/lualine.nvim
-----------------------------------------------------------

local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
  return
end

lualine.setup({
  options = {
    theme = 'auto',
    globalstatus = true,        -- single statusline (matches laststatus=3)
    icons_enabled = true,
    section_separators = '',
    component_separators = '|',
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { { 'filename', path = 1 } },
    lualine_x = { 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
})
