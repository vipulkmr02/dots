return {
  'folke/trouble.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  cmd = 'Trouble',
  init = function()
    require("trouble").setup({
      auto_preview = false
    })
  end
}
