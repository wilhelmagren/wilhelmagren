require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'bash',
    'c',
    'fish',
    'go',
    'html',
    'java',
    'javascript',
    'lua',
    'make',
    'markdown',
    'markdown_inline',
    'python',
    'rust',
    'sql',
    'toml',
    'vim',
  },

  -- Install parsers synchronously.
  sync_install = true,

  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
})
