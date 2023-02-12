require('plugins')

-- Enable line numbers.
vim.opt.number = true
-- Enable relative line numbering.
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Enable mouse support for copy/paste.
vim.opt.mouse = 'a'

-- Indentation using spaces.
-- tabstop:		width of a tab character
-- softtabstop:		fine tunes the amount of whitespace to be added
-- shiftwidth:		determine the amnount of whitespace to add in
-- 			normal mode, i.e., neither visual nor insert
-- expandtab:		use spaces instead of tabs
-- textwidth:		max text width before wrapping the line
-- autoindent:		enable autoindent on next line if expected
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.textwidth = 90

