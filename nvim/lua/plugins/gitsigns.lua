return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require 'gitsigns'.setup {
      current_line_blame_opts = {
        delay = 10,
        virt_text_pos = 'right_align'
      },
      signcolumn = false,
      numhl = true,
    }
  end
}
