-- Configure the statusline.
require('lualine').setup({
    icons_enabled = false,
    theme = 'onedark',
    sections = {
        lualine_b = { 'filename' },
        lualine_c = { 'branch', 'diff' },
        lualine_y = { 'diagnostics' },
    },
})
