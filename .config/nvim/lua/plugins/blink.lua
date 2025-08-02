-- [[ Setup blink completion ]]
--

return {
  {
    'saghen/blink.cmp',
    event = 'VimEnter',
    build = 'cargo build --release',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
        build = (function()
          -- Build step is needed for regex support in snippets.
          -- This is not supported in all windows environments.
          if vim.fn.has('win32') == 1 or vim.fn.executable('make') == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        opts = {},
      },
    },

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = 'default',
      },

      appearance = {
        nerd_font_variant = 'mono',
      },

      completion = {
        -- Automatically show the documentation after hovering for 1 second.
        documentation = { auto_show = true, auto_show_delay_ms = 1000 },
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      snippets = { preset = 'luasnip' },

      fuzzy = { implementation = 'prefer_rust' },

      -- Shows a signature help window while typing arguments for a function.
      signature = { enabled = true },
    },
  },
}
