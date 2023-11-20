vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup({
    sort_by = 'case_sensitive',
})

local api = require('nvim-tree.api')

function open_tree()
    api.tree.open()
end

function toggle_tree()
    api.tree.toggle()
end

function close_tree()
    api.tree.close()
end
