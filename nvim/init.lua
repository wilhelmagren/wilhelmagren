-- Load `nvim-packer` and all plugins.
require('pacman')
require('colorscheme')
require('explorer')
require('lsp')
require('completions')
require('statusline')
require('telescope')
require('treesitter')

-- Enable relative line numbers.
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Enable mouse support for copy/paste.
vim.opt.mouse = 'a'

-- Indentation using spaces.
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.textwidth = 90

-- Set the offset for when buffer starts moving.
vim.opt.scrolloff = 12

-- Always open `nvim-tree` file explorer at start.
open_tree()

vim.keymap.set('', '<M-e>', toggle_tree)
