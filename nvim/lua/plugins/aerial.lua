return {
  'stevearc/aerial.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
  init = function()
    require("aerial").setup({
      default_direction = "left",
      highlight_on_hover = true,
      autojump = true,
      resize_to_content = true,
    })
  end
}
