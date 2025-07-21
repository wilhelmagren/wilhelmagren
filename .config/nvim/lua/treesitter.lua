require('nvim-treesitter.configs').setup({
    -- The below list of parsers should always be installed.
    ensure_installed = {
        'python',
        'rust',
        'lua',
        'c',
        'cpp',
        'go',
        'make',
        'java',
        'javascript',
        'typescript',
        'vim',
        'toml',
        'ini',
        'gitignore',
        'bash',
        'fish',
    },

    -- Install parsers synchronously (only applied to `ensure_installed`).
    sync_install = true,

    -- Automatically install any missing parsers when entering the
    -- corresponding filetype buffer.
    auto_install = true,

    highlight = {
        enable = true,
    },
})
