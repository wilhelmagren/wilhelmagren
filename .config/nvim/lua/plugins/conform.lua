-- [[ Setup auto formatting with conform ]]

return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format({ async = true, lsp_format = 'fallback' })
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable `format_on_save lsp_fallback` for languagees that don't have
        -- a well standardized coding style.
        local disable_filetypes = { c = true, cpp = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          return {
            timeout_ms = 500,
            lsp_format = 'fallback',
          }
        end
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'ruff_format' },
        rust = { 'rustfmt' },
      },
      formatters = {
        stylua = {
          inherit_options = true,
          prepend_args = {
            '--quote-style',
            'AutoPreferSingle',
            '--indent-type',
            'Spaces',
            '--indent-width',
            '2',
          },
        },
      },
    },
  },
}
