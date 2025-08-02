-- [[ Setup treesitter required parsers etc. ]]
--

return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
      ensure_installed = {
        'bash',
        'c',
        'cpp',
        'fish',
        'go',
        'html',
        'java',
        'javascript',
        'lua',
        'luadoc',
        'make',
        'markdown',
        'markdown_inline',
        'python',
        'rust',
        'toml',
        'typescript',
        'vim',
      },

      -- Install parsers synchronously.
      sync_install = true,

      -- Autoinstall languages that are not installed.
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
}
