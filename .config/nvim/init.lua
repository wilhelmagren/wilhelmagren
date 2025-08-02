--[[
--
--]]

-- Set <space> as the leader key.
--  See `:help mapleader`
-- NOTE: this must happen before plugins are loaded (otherwise wrong leader will be used).
vim.g.mapleader = ' '
vim.gmaplocalleader = ' '

vim.g.have_nerd_font = true

require('options')
require('pacman')
require('keymaps')
require('mini')
require('lsp')
