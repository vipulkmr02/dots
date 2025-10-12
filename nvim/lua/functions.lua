-- Functions keep all the custom functions here
-- with their keymaps.

function NotesModeToggle()
  if (vim.g.notes_mode == false) then
    vim.g.notes_mode = true
    vim.opt.relativenumber = false
    vim.opt.number = false
    vim.opt.laststatus = 0
    vim.opt.wrap = true
    vim.opt.wrapmargin = 80
  else
    vim.g.notes_mode = false
    vim.opt.relativenumber = true
    vim.opt.number = true
    vim.opt.laststatus = 3
    vim.opt.wrap = false
    vim.opt.wrapmargin = 80
  end
end

vim.keymap.set('n', '<leader>fmn', ':lua NotesMode()<CR>', { silent = true })

function EditConfig()
  vim.cmd('cd ' .. vim.fn.stdpath('config'))
  vim.cmd('edit init.lua')
end

vim.keymap.set('n', '<leader>fe', ':lua EditConfig()<CR>', { silent = true })

function HideLualine() require('lualine').hide() end

vim.keymap.set('n', '<leader>fhl', ':lua HideLualine()<CR>', { silent = true })

function UnHideLualine() require('lualine').hide({ unhide = true }) end

vim.keymap.set('n', '<leader>fsl', ':lua UnHideLualine()<CR>', { silent = true })

function SetThemeWT(color)
  vim.cmd("colorscheme " .. color)
  if vim.g.borderBGclean then
    vim.cmd('hi FloatBorder guibg=None')
    vim.cmd('hi Float guibg=None')
    vim.cmd('hi TelescopeBorder guibg=None')
    vim.cmd('hi TelescopeBorder guibg=None')
  end
  if vim.g.noBG then
    vim.cmd('hi Normal guibg=None')
  end
end
