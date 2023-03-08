-- Configure the syntax highlighting
require'nvim-treesitter.configs'.setup {
    ensure_installed = { 'c', 'rust', 'python', 'lua',
    'bash', 'typescript', 'java', 'vim', 'help' },

    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    -- List of parsers to ignore installing (for 'all')
    ignore_install = { 'javascript', },

    highlight = {
        enable = true,
    },
}

