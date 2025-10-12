return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "mfussenegger/nvim-dap-python",
    "nvim-neotest/nvim-nio",
    "jay-babu/mason-nvim-dap.nvim"
  },
  init = function()
    require('dap-python').setup("/usr/bin/python3")
    local dap = require('dap')
    dap.defaults.fallback.force_external_terminal = true
    vim.fn.sign_define('DapBreakpoint',
      {
        text = ' ',
        texthl = '',
        linehl = 'CursorLine',
        numhl = 'CursorLine'
      }
    )
    require('dapui').setup({
      icons = { expanded = " ", collapsed = " " },
      mappings = {
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
      },
      expand_lines = vim.fn.has("nvim-0.7"),
      layouts = {
        {
          elements = {
            "scopes",
          },
          size = 0.3,
          position = "right"
        },
        {
          elements = {
            "repl",
            "breakpoints"
          },
          size = 0.3,
          position = "bottom",
        },
      },
      floating = {
        max_height = nil,
        max_width = nil,
        border = "single",
        mappings = {
          close = { "q", "<Esc>" },
        },
      },
      windows = { indent = 1 },
      render = {
        max_type_length = nil,
      },
    })
    require('mason-nvim-dap').setup({
      ensure_installed = { 'debugpy', 'js-debug' },
      handlers = { function(config)
        require('mason-nvim-dap').default_setup(config)
      end }
    })
  end
}
