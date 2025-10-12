return {
  'nvim-tree/nvim-tree.lua',
  lazy = true,
  init = function()
    require('nvim-tree').setup({
      view = {
        side = 'right',
      }
    })
  end
}
