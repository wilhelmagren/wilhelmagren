-- [[ Setting default options ]]
--  See `:help vim.o`
--  and `:help vim.opt`
-- For more options, you can see `help: option-list`.

-- Enable line numbers and make them relative (except for the current line)
-- and also enable cursorline (highlight current line).
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- Enable mouse mode, can be useful for copy/paste or resizing splits.
vim.o.mouse = 'a'

-- Enable break indent.
vim.o.breakindent = true

-- Save the undo history.
vim.o.undofile = true
vim.o.swapfile = false

-- Case-insensitive searching UNLESS '\C' or one or more capital letters in the search term.
--  See `:help ignorecase`
--  and `:help smartcase`
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default.
--  See `:help signcolumn`
vim.o.signcolumn = 'yes'

-- Decrease the update time.
vim.o.updatetime = 250

-- Set how to display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live in another window as you type.
vim.o.inccommand = 'split'
vim.o.splitbelow = true -- Horizontal splits go below.
vim.o.splitright = true -- Vertical splits go right.

-- If performing an operation that would fail due to unsaved changes in the buffer
-- (like `:q`), instead raise a dialog asking if you wish to save the current file(s).
--  See `:help 'confirm'`
vim.o.confirm = true

-- Default indendation options, filetype specific options go under 'after/ftplugin'.
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.textwidth = 100

vim.o.wrap = true
