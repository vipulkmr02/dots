-- Custom Lua components
local function total_lines()
  return vim.api.nvim_buf_line_count(0)
end

local function caps_lock_indicator()
  local output = vim.fn.system([[ sh ~/.tmux/widgets.sh caps_lock ]])
  if vim.v.shell_error ~= 0 then
    return [[-]], "Err EC: " .. vim.v.shell_error
  end
  return output:gsub("^%s*(.-)%s*$", "%1") == 'off' and [[-]] or [[^]]
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    sections = {
      lualine_a = { 'filename' },
      lualine_b = { 'diff', 'diagnostics' },
      lualine_c = { 'aerial' },
      lualine_x = { 'selectioncount', 'filetype' },
      lualine_y = { 'branch', 'lsp_progress' },
      lualine_z = { 'location', total_lines }
    },
    extensions = {
      'trouble',
      'quickfix',
      'mason',
      'man',
      'lazy',
      'fzf',
      'fugitive',
      'nvim-dap-ui',
      'aerial'
    },
    options = {
      -- Circular
      -- component_separators = { left = '|', right = '|' },
      -- section_separators = { left = '', right = '' },

      -- Slanting
      -- component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },

      -- Pointed
      -- component_separators = { left = '', right = '' },
      -- section_separators = { left = '', right = '' },

      -- Simple
      -- component_separators = { left = '│', right = '│' },
      component_separators = { left = '', right = '' },
      -- section_separators = { left = '', right = '' },

      refresh = {
        -- statusline = 500
      }
    }
  }
}
