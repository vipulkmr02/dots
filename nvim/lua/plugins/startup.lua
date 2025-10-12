-- return {
--   'nvimdev/dashboard-nvim',
--   event = 'VimEnter',
--   config = function()
--     require('dashboard').setup {
--       theme = 'doom',
--       center = {
--         {
--           icon = '',
--           icon_hl = 'group',
--           desc = 'description',
--           desc_hl = 'group',
--           key = 'shortcut key in dashboard buffer not keymap !!',
--           key_hl = 'group',
--           key_format = ' [%s]',   -- `%s` will be substituted with value of `key`
--           action = '',
--         },
--       },
--       footer = {},
--     }
--   end,
--   dependencies = { { 'nvim-tree/nvim-web-devicons' } }
-- }

return {
  'goolord/alpha-nvim',
  config = function()
    local theme = require('alpha.themes.theta')
    theme.header.val = {
      [[                _ __          __  __            ____      __]],
      [[ _      _______(_) /____     / /_/ /_  ___     / __/_  __/ /___  __________]],
      [[| | /| / / ___/ / __/ _ \   / __/ __ \/ _ \   / /_/ / / / __/ / / / ___/ _ \]],
      [[| |/ |/ / /  / / /_/  __/  / /_/ / / /  __/  / __/ /_/ / /_/ /_/ / /  /  __/]],
      [[|__/|__/_/  /_/\__/\___/   \__/_/ /_/\___/  /_/  \__,_/\__/\__,_/_/   \___/]]
    }
    require 'alpha'.setup(theme.config)
  end
}
