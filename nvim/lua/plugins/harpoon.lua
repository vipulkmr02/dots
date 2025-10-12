return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    lazy = true,
    dependencies = { "nvim-lua/plenary.nvim" },
    init = function()
      local hp = require("harpoon")
      hp:setup()
      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', '<leader>/g', function() hp:list():add() end, opts)
      vim.keymap.set('n', '<leader>/a', function() hp:list():select(1) end, opts)
      vim.keymap.set('n', '<leader>/s', function() hp:list():select(2) end, opts)
      vim.keymap.set('n', '<leader>/d', function() hp:list():select(3) end, opts)
      vim.keymap.set('n', '<leader>/f', function() hp:list():select(4) end, opts)
      vim.keymap.set("n", "<leader>//", function() hp.ui:toggle_quick_menu(hp:list()) end)
    end
  }
}
