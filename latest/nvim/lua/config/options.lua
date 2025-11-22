-- Enable line numbers and make them relative to the current line.
-- Also enable cursorline (highlight current line).
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- Enable mouse mode, useful for copy/paste or resizing splits.
vim.o.mouse = 'a'

-- Enable break indent.
vim.o.breakindent = true

-- Save the undo history.
vim.o.undofile = true

-- Case-insesitive searching UNLESS '\C' or one or more capital latters are used in the search term.
--  See `:help  ignorecase`
--  and `:help  smartcase`
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default.
--  See `:help  signcolumn`
vim.o.signcolumn = 'yes'

-- Decrease the update interval time (ms).
vim.o.updatetime = 200

-- Preview substitutions live in another window as you type.
vim.o.inccommand = 'split'

-- If performing an operation that would fail due to unsaved changes in the buffer,
-- (like `:q`), instead raise a dialog asking if you wish to save the current file(s).
--  See `:help 'confirm'`
vim.o.confirm = true

-- Default indentation options, filetype specific options go under 'after/ftplugin'.
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.textwidth = 100

-- Turn on truecolor everywhere.
vim.opt.termguicolors = true
