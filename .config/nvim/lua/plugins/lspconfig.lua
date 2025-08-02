--[[ Setup LSP config ]]
--  See `lsp.lua` in parent directory for LSP config.

return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {

      -- Status update window for LSP.
      { 'j-hui/fidget.nvim', opts = {} },

      -- Allows extra capabilities provided by `blink`.
      'saghen/blink.cmp',
    },
  },
}
