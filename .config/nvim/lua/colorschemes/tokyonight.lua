-- [[ Setup tokyonight colorscheme ]]

return {
  'folke/tokyonight.nvim',
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    ---@diagnostics diable-next-line: missing-fields
    require('tokyonight').setup({
      styles = {
        comments = { italic = true },
      },
      transparent = true,
    })

    -- Load the colorscheme here.
    vim.cmd.colorscheme('tokyonight-night')
  end,
}
