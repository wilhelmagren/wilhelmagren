local keymap = vim.keymap.set
local telescope_builtin = require('telescope.builtin')

keymap('i', 'jk', '<Esc>', { noremap = false, desc = 'quick escape with "jk"' })
keymap('n', '<C-f>', telescope_builtin.find_files, { desc = 'fuzzy find from cwd' })
