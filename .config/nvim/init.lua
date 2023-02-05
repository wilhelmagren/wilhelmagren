-- Define some local variables referring to vim functions.
local call = vim.call
local Plug = vim.fn['plug#']
local PATH = string.format('%s/.local/share/nvim/site/plugged', os.getenv('HOME'))

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
vim.opt.autoindent = true

-- Set up all neovim plugins, using vim-plug.
-- https://github.com/junegunn/vim-plug
call('plug#begin', PATH)

-- Shortcut for replacing " or ' inside string body.
Plug('tpope/vim-surround')

-- Blazing fast and easy to configure statusline, pure lua.
Plug('nvim-lualine/lualine.nvim')

-- Colorscheme/theme.
Plug('navarasu/onedark.nvim')

call('plug#end')

local lualine = require('lualine')
lualine.setup({
   icons_enabled = true,
    theme = 'onedark',
    sections = {
        lualine_b = { 'filename' },
        lualine_c = { 'branch', 'diff' },
        lualine_x = {},
        lualine_y = { 'diagnostics' },
    },
})

local onedark = require('onedark')
onedark.setup({
    style = 'dark',
    colors = {
        grey = '#878787',
        green = '#00ffaa',
    },
    highlights = {
        Visual = { bg = '#414141' },
    },
})
onedark.load()

