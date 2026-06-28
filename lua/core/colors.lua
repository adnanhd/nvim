-----------------------------------------------------------
-- Colorscheme: rose-pine
-- URL: https://github.com/rose-pine/neovim
-----------------------------------------------------------

local status_ok, rose = pcall(require, 'rose-pine')
if not status_ok then
  return
end

rose.setup({
  variant = 'main',        -- 'auto' | 'main' (dark) | 'moon' (dark) | 'dawn' (light)
  dark_variant = 'main',
  styles = {
    italic = false,
    transparency = false,
  },
})

vim.opt.termguicolors = true
vim.cmd('colorscheme rose-pine')
