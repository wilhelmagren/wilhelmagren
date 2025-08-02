-- [[ Setup package manager 'lazy' and plugins ]]
--
-- To check the current status of the plugins
--  run `:Lazy`
--
-- To update plugins
--  run `:Lazy update`

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

-- Prepend the lazy path to the list of neovim runtime directories.
--  See `help: rtp`
---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup({
  require('colorschemes.kanagawa'),

  require('plugins.blink'),
  require('plugins.mini'),
  require('plugins.treesitter'),
  require('plugins.lspconfig'),
  require('plugins.telescope'),
  require('plugins.conform'),
})
