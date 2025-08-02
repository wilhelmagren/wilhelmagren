-- [[ Keymaps setup ]]
--  See `:help vim.keymap.set()`

vim.keymap.set('n', 'nh', '<cmd>nohlsearch<CR>', { desc = '[N]o [H]ighlight' })
vim.keymap.set('i', 'jk', '<Esc>', { noremap = false, desc = 'Exit insert mode [J]ust [K]idding' })
