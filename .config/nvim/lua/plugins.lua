-- Install ``packer`` if not already installed.
-- https://github.com/wbthomason/packer.nvim
local ensure_packer = function()
    local fn = vim.fn
    local path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(path)) > 0 then
        fn.system({
            'git',
            'clone',
            '--depth',
            '1',
            'https://github.com/wbthomason/packer.nvim',
            path,
        })
        vim.cmd [[ packadd packer.nvim ]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup({ function(use)
    -- Packer can install itself
    use('wbthomason/packer.nvim')

    -- Statusline
    use({
        'nvim-lualine/lualine.nvim',
        config = function()
            require('lualine').setup({
                icons_enabled = true,
                theme = 'onedark',
                sections = {
                    lualine_b = { 'filename' },
                    lualine_c = { 'branch', 'diff' },
                    lualine_x = {},
                    lualine_y = { 'diagnostics' },
                }
            })
        end,
    })

    -- Highlighting
    use({
        'nvim-treesitter/nvim-treesitter',
        requires = {
            'nvim-treesitter/nvim-treesitter-refactor',
        },
    })

    -- Colorscheme
    use({
        'navarasu/onedark.nvim',
        config = function()
            require('onedark').setup {
                style = 'dark',
                colors = {
                    grey = '#878787',
                    green = '#00ffaa',
                },
                highlights = {
                    Visual = { bg = '#414141' },
                },
            }
            require('onedark').load()
        end
    })

    if packer_boostrap then
        require('packer').sync()
    end
end
})

