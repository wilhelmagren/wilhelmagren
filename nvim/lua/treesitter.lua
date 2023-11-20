require('nvim-treesitter.configs').setup {
    -- The below listed parsers should always be installed.
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
    },

    -- Install parsers synchronously (only applied to `ensure_installed`).
    sync_install = true,
    
    -- Automatically install missing parsers when entering buffer.
    auto_install = true,

    highlight = {
        enable = true,
    },
}
