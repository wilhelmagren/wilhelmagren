-- Install `packer.nvim` if not already installed.
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

return require('packer').startup(function(use)

    -- Packer can install itself.
    use('wbthomason/packer.nvim')

    -- Proper syntax highlighting.
    use({
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    })

    -- Autocompletion and snippets.
    use('hrsh7th/nvim-cmp')
    use('hrsh7th/cmp-nvim-lsp')
    use('L3MON4D3/LuaSnip')

    -- Language Server Protocol functionality.
    use('williamboman/mason.nvim')
    use('williamboman/mason-lspconfig.nvim')
    use('neovim/nvim-lspconfig')

    -- File system explorer.
    use({
        'nvim-tree/nvim-tree.lua',
        requires = { 'nvim-tree/nvim-web-devicons' },
    })

    -- Fuzzy finder.
    use({
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
    })

    -- Statusline.
    use('nvim-lualine/lualine.nvim')

    -- Colorscheme.
    use('navarasu/onedark.nvim')

    -- Greeter.
    use({
        'goolord/alpha-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
    })

    if packer_bootstrap then
	    require('packer').sync()
    end
end)
