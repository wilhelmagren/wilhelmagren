-- [[ Setup kanagawa colorscheme ]]

return {
  'rebelot/kanagawa.nvim',
  config = function()
    require('kanagawa').setup({
      undercurl = true,
      commentStyle = { italic = true },
      transparent = true,
      theme = 'dragon',
      background = {
        dark = 'dragon',
      },
    })

    -- Load the colorscheme.
    vim.cmd.colorscheme('kanagawa')
  end,
}
