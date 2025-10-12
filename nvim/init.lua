Global = vim.g
Option = vim.opt
Tabs = 4
-- Global options
-- Appearance
Global.copilot_no_tab_map = true
Global.colorscheme = 'github_dark_colorblind'
Global.adwaita_darker = true
Global.have_nerd_font = true
Global.borderBGclean = true
Global.noBG = true
Global.netrw_banner = false
Global.notes_mode = false
Global.autoread = true
Global.mapleader = ' '
Global.maplocalleader = ' '
-- !! Global options

Option.autochdir = false
Option.expandtab = true     -- 'expandtab' converts tabs to spaces
Option.number = true
Option.relativenumber = true
Option.scrolloff = 4

Option.shiftwidth = Tabs
Option.tabstop = Tabs
Option.softtabstop = Tabs
Option.smartindent = true
Option.spell = false
Option.spelllang = "en_us"

Option.syntax = "on"
Option.wrap = false
Option.inccommand = "split"

Option.backup = false
Option.swapfile = true

Option.hlsearch = true
Option.incsearch = true

Option.termguicolors = true
Option.ignorecase = true
Option.smartcase = true
Option.showmode = true

Option.undofile = true
Option.breakindent = true
Option.updatetime = 1000

Option.splitright = true
Option.splitbelow = true
Option.cmdheight = 1
Option.cmdwinheight = 5

Option.list = true
Option.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
Option.linebreak = true

Option.timeoutlen = 500
Option.lazyredraw = true
Option.fillchars = "eob:·"
Option.laststatus = 3

-- checkpoint requires
require('lazy-installer')
require('lazy').setup({ { import = 'plugins' }, { import = 'plugins.lsp' } })
require('keymaps')
require('functions')
require('autocmds')
require('language-server')
-- require('debugging')

-- the most important thing in the world
-- SetThemeWT(Global.colorscheme)
vim.cmd('colorscheme ' .. Global.colorscheme)
vim.cmd('Copilot disable')
