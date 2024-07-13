local footer = function()
    local stats = require("lazy").stats()
    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
    local str = "   " .. stats.count .. " plugins in " .. ms .. "ms"
    return vim.list_extend({ "", str, "" }, require("fortune").fortune(true))
end

local hyper_config  = {
  shortcut = {
    -- action can be a function type
    { desc = string, group = 'highlight group', key = 'shortcut key', action = 'action when you press key' },
  },
  packages = { enable = true }, -- show how many plugins neovim loaded
  -- limit how many projects list, action when you press key or enter it will run this action.
  -- action can be a functino type, e.g.
  -- action = func(path) vim.cmd('Telescope find_files cwd=' .. path) end
  project = { enable = true, limit = 8, icon = 'your icon', label = '', action = 'Telescope find_files cwd=' },
  mru = { limit = 10, icon = 'your icon', label = '', cwd_only = false },
  footer = {}, -- footer
}

local doom_config = {
    center = {
        {
            icon = '',
            icon_hl = 'group',
            desc = 'description',
            desc_hl = 'group',
            key = 'shortcut key in dashboard buffer not keymap !!',
            key_hl = 'group',
            key_format = ' [%s]', -- `%s` will be substituted with value of `key`
                action = '',
        },
    },
    footer = {},
}


require("dashboard").setup({
    theme = 'hyper',
    config = { 
      footer = { "", "", require("fortune").fortune() },
      week_header = {
       enable = true,
      },
      shortcut = {
        { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
        {
          icon = ' ',
          icon_hl = '@variable',
          desc = 'Files',
          group = 'Label',
          action = 'Telescope find_files',
          key = 'f',
        },
        {
          desc = ' Apps',
          group = 'DiagnosticHint',
          action = 'Telescope app',
          key = 'a',
        },
        {
          desc = ' dotfiles',
          group = 'Number',
          action = 'Telescope dotfiles',
          key = 'd',
        },
      },
    },
  })
