return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  init = function()
    require('bufferline').setup({
      options = {
        mode = 'tabs',
        style_preset = require('bufferline').style_preset.minimal,
        always_show_bufferline = false,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "center",
          },
          {
            filetype = "undotree",
            text = "Undo Tree",
            text_align = "center",
          }
        },
        separator_style = "thick",
        themable = true,
        numbers = "ordinal",
        -- diagnostics = "nvim_lsp",
        -- diagnostics_update_in_insert = "true",
        color_icons = true,
        hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
        }
      }
    })
  end
}
