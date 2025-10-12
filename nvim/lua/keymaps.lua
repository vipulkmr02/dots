local setMap = vim.keymap.set
local opts = { noremap = true, silent = true }

setMap({ 'n', 'v' }, '<Space>', '<Nop>')
-- % EDITOR starts %
setMap('n', '<leader>w', ':write<cr>', opts)
setMap('n', '<leader>q', ':quit<cr>', opts)
setMap('n', '<leader>Q', ':quit!<cr>', opts)
setMap({ 'n', 'i', 'v' }, '<M-;>', '<ESC>', opts)
setMap('n', '<leader>s', '<c-w>', opts)
setMap('n', '<leader>r', ':so $MYNVIMRC<cr>', opts)
setMap('n', '<leader>N', ':nohl<cr>', opts)
setMap('n', '<leader>E', ':Ex<cr>', opts)
setMap('n', '<M-,>', '<C-o>', opts)
setMap('n', '<M-.>', '<C-i>', opts)
setMap('n', '<leader>Y', '0vyp', opts)
setMap('n', '<M-t>', ':term bash<CR>', opts)

-- NOTE: this keymap move selected block down & also re-indents them
setMap('v', 'J', ':m \'>+1<CR>gv=gv', opts)

-- NOTE: this keymap move selected block up & also re-indents them
setMap('v', 'K', ':m \'<-2<CR>gv=gv', opts)

setMap({ 'n', 'v' }, '<M-j>', '0V"typ', opts)
setMap({ 'n', 'v' }, '<M-k>', '0V"tykp', opts)

-- NOTE: this keymap switches to the last file
setMap({ 'n' }, '<M-l>', '<C-^>', opts)
-- % EDITOR ends %

-- % SPLITS start %
setMap('n', '<leader>_', ':vsplit<cr>', opts)
setMap('n', '<leader>-', ':split<cr>', opts)
setMap('n', '<leader>j', '<c-w>j', opts)
setMap('n', '<leader>k', '<c-w>k', opts)
setMap('n', '<leader>l', '<c-w>l', opts)
setMap('n', '<leader>h', '<c-w>h', opts)
setMap('n', '<leader>J', '<c-w>J', opts)
setMap('n', '<leader>K', '<c-w>K', opts)
setMap('n', '<leader>L', '<c-w>L', opts)
setMap('n', '<leader>H', '<c-w>H', opts)
-- % SPLITS end %

-- % TABS start %
setMap('n', '<leader><space>\\', ':tabnew<cr>', opts)
setMap('n', '<leader><space>.', ':tabnext<cr>', opts)
setMap('n', '<leader><space>,', ':tabprev<cr>', opts)
-- % TABS end %

-- % BUFFERS start %
setMap('n', '<leader>b.', ':bnext<cr>', opts)
setMap('n', '<leader>b,', ':bprev<cr>', opts)
setMap('n', '<leader>bd', ':bd<cr>', opts)
setMap('n', '<leader>bD', ':bd!<cr>', opts)
setMap('n', '<leader>bp', ':BufferLinePick<cr>', opts)

-- % BUFFERS end %

-- % PLUGINS start %
setMap('n', '<leader>pm', ':Mason<cr>', opts)
setMap('n', '<leader>ptt', ':Trouble<cr>', opts)
setMap('n', '<leader>ptr', ':TroubleRefresh<cr>', opts)
setMap('n', '<leader><F3>', ':NvimTreeToggle<cr>', opts)
setMap('n', '<leader><F5>', ':UndotreeToggle<cr>', opts)
-- % PLUGINS end %

-- % TELESCOPE start %
-- setMap('n', '<leader>tf', ':Telescope find_files<cr>', opts)
setMap('n', '<leader>tg', ':Telescope live_grep<cr>', opts)
setMap('n', '<leader>tb', ':Telescope buffers<cr>', opts)
setMap('n', '<leader>ta', ':Telescope lsp_document_symbols<cr>', opts)
setMap('n', '<leader>td', ':Telescope diagnostics<cr>', opts)
setMap('n', '<leader>tt', ':Telescope <cr>', opts)
-- % TELESCOPE end %

-- % GITSIGNS start %
setMap({ 'n', 'v' }, '<leader>Ghs', ':Gitsigns stage_hunk<cr>', opts)
setMap('n', '<leader>Gbs', ':Gitsigns stage_buffer<cr>', opts)
setMap('n', '<leader>Ghu', ':Gitsigns undo_stage_hunk<cr>', opts)
setMap('n', '<leader>Ghn', ':Gitsigns next_hunk<cr>', opts)
setMap('n', '<leader>Ghp', ':Gitsigns prev_hunk<cr>', opts)
setMap('n', '<leader>GhP', ':Gitsigns preview_hunk<cr>', opts)
setMap('n', '<leader>Gtb', ':Gitsigns toggle_current_line_blame<cr>', opts)
setMap('n', '<leader>Gts', ':Gitsigns toggle_signs<cr>', opts)
setMap('n', '<leader>Gtn', ':Gitsigns toggle_numhl<cr>', opts)
-- % GITSIGNS end %

-- % NEOGIT start %
setMap('n', '<leader>n', ':Neogit<cr>')
-- % NEOGIT end %

-- % DEBUG start %
-- Following keymaps are referenced from
-- dap-mappings section in neovim's help
setMap('n', '<F9>', require('dap').continue, { desc = "[DBG] Continue" })
setMap('n', '<F10>', require('dap').step_over, { desc = "[DBG] Step Over" })
setMap('n', '<F11>', require('dap').step_into, { desc = "[DBG] Step Into" })
setMap('n', '<S-F11>', require('dap').step_out, { desc = "[DBG] Step Out" })
setMap('n', '<Leader>gb', require('dap').toggle_breakpoint, { desc = "[DBG] Toggle Breakpoint" })
setMap('n', '<Leader>gl',
  function()
    require('dap').set_breakpoint(
      nil, nil, vim.fn.input('Log point message: '
      ))
  end,
  { desc = "[DBG] Set Log Point" }
)
setMap('n', '<Leader>gu', require('dapui').toggle, { desc = "[DBG] Toggle DAP UI" })
-- setMap('n', '<Leader>gU', require('dapui'))
setMap('n', '<Leader>gr', require('dap').repl.open, { desc = "[DBG] Open DAP REPL" })
setMap('n', '<Leader>grl', require('dap').run_last, { desc = "[DBG] Run Last Session" }) -- Corrected key to avoid conflict
setMap({ 'n', 'v' }, '<Leader>gh', require('dap.ui.widgets').hover, { desc = "[DBG] Hover on Variable/Expression" })
setMap({ 'n', 'v' }, '<Leader>gp', require('dap.ui.widgets').preview, { desc = "[DBG] Preview Variable" })
setMap('n', '<Leader>gf', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end, { desc = "[DBG] Show Call Stack (Frames)" })
setMap('n', '<Leader>gs', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end, { desc = "[DBG] Show Scopes (Variables)" })
-- % DEBUG end %


-- % COPILOT start %
vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})
-- % COPILOT end %
