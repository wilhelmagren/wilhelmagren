require('treesitter')
require('lsp')
require('formatter')
require('completions')
require('telescope')
require('keymaps')
require('colorscheme')

-- Enable relative line numbers combined with an absolute
-- line number on the current position.
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Set the offset for when the buffer starts moving up or down.
vim.opt.scrolloff = 10

-- Enable mouse support for copy and paste.
vim.opt.mouse = 'a'

-- Global indentation options (see 'after/ftplugin') for filetype specifics.
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.textwidth = 100
