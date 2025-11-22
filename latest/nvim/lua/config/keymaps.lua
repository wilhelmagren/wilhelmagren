local map = vim.keymap.set

map('n', 'nh', '<cmd>nohlsearch<CR>', { desc = '[N]o [H]ighlight' })
map('i', 'jk', '<Esc>', { desc = 'Exit insert mode [J]ust [K]idding' })

local builtin = require('telescope.builtin')
map('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
map('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })

map('n', '<leader>sd', '<CMD>:Oil --float .<CR>', { desc = '[S]earch [D]irectoy' })
