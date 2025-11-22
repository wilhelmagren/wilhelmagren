-- Set <space> as the leader key.
--  See `:help mapleader`
-- NOTE: this must happen before plugins are loaded to avoid the wrong leader being used

vim.g.mapleader = ' '
vim.g.maplocallreader = ' '

vim.g.have_nerd_font = true

require('config.autocmds')
require('config.colorscheme')
require('config.options')
require('config.keymaps')
require('config.telescope')
require('config.completions')
require('config.lsp')
require('config.oil')
require('config.treesitter')
