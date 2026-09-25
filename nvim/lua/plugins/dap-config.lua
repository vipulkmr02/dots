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
    local dapui = require('dapui')

    vim.fn.sign_define('DapBreakpoint', {
      text = ' ',
      texthl = '',
      linehl = 'CursorLine',
      numhl = 'CursorLine'
    })

    -- Keep the debugger UI minimal: watches, call stack, and expression REPL.
    dapui.setup({
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
            { id = "watches", size = 1.0 },
          },
          size = 0.25,
          position = "left",
        },
        {
          elements = {
            { id = "stacks", size = 1.0 },
          },
          size = 0.25,
          position = "right",
        },
        {
          elements = {
            { id = "repl", size = 1.0 },
          },
          size = 0.25,
          position = "bottom",
        },
        {
          elements = {
            { id = "console", size = 1.0 },
          },
          size = 0.25,
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

    -- Independent panel toggles.
    vim.keymap.set('n', '<Leader>dw', function()
      dapui.toggle({ layout = 1 })
    end, { desc = "[DBG] Toggle Watches" })

    vim.keymap.set('n', '<Leader>ds', function()
      dapui.toggle({ layout = 2 })
    end, { desc = "[DBG] Toggle Call Stack" })

    vim.keymap.set('n', '<Leader>de', function()
      dapui.toggle({ layout = 3 })
    end, { desc = "[DBG] Toggle Expression REPL" })

    vim.keymap.set('n', '<Leader>do', function()
      dapui.toggle({ layout = 4 })
    end, { desc = "[DBG] Toggle Output Console" })

    require('mason-nvim-dap').setup({
      ensure_installed = { 'debugpy', 'js-debug' },
      handlers = {
        function(config)
          require('mason-nvim-dap').default_setup(config)
        end
      }
    })
  end
}
