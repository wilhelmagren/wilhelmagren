-- Set <space> as the leader key before loading anything else.
--  See `help: mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

require('config.autocmds')
require('config.colorscheme')
require('config.options')
require('config.keymaps')
require('config.telescope')
require('config.completions')
require('config.diagnostics')
require('config.lsp')
require('config.oil')
require('config.treesitter')
