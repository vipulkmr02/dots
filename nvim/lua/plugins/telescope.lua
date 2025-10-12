return {
  'nvim-telescope/telescope.nvim',
  config = {
    defaults = {
      prompt_prefix = '   ',
      selection_strategy = 'reset',
      sorting_strategy = 'ascending',
      layout_config = {
        width = 0.8,
        height = 0.9,
      }
    },
    pickers = {
      find_files = {
        theme = "dropdown",
        no_ignore = true,
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        case_sensitive = false,
        smart_case = true,
      }
    }
  },
  init = function()
    local builtin = require('telescope.builtin')

    local function find_files_with_hidden()
      builtin.find_files({
        hidden = true,    -- Include hidden files
        no_ignore = true, -- Include files ignored by `.gitignore`
      })
    end

    local function find_files_regular()
      builtin.find_files({
        hidden = false,    -- Exclude hidden files
        no_ignore = false, -- Respect `.gitignore`
      })
    end

    -- Keymaps
    vim.keymap.set("n", "<leader><leader>f", find_files_regular, { desc = "Find files (default)" })
    vim.keymap.set("n", "<leader><leader>h", find_files_with_hidden, { desc = "Find all files including hidden and ignored" })
  end
}
