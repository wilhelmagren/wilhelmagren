-- [[ Keymaps setup ]]
--  See `:help vim.keymap.set()`

local map = vim.keymap.set

map('n', 'nh', '<cmd>nohlsearch<CR>', { desc = '[N]o [H]ighlight' })
map('i', 'jk', '<Esc>', { noremap = false, desc = 'Exit insert mode [J]ust [K]idding' })

map('n', '<leader>sd', '<CMD>:Oil --float .<CR>', { desc = '[S]earch [D]irectory' })

-- d => delete
-- <leader>d => cut
map({ 'n', 'v' }, 'x', '"_x', { noremap = false, desc = 'Cut without yanking' })
map({ 'n', 'v' }, 'd', '"_d', { noremap = false, desc = '[D]elete without yanking' })
map({ 'n', 'v' }, 'D', '"_D', { noremap = false, desc = '[D]elete without yanking' })
map({ 'n', 'v' }, '<leader>x', '""x', { noremap = false, desc = 'Cut and yank' })
map({ 'n', 'v' }, '<leader>d', '""d', { noremap = false, desc = '[D]elete and yank' })
map({ 'n', 'v' }, '<leader>D', '""D', { noremap = false, desc = '[D]elete and yank' })
