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

return require('packer').startup( function(use)
    -- Packer can install itself.
    use('wbthomason/packer.nvim')

    -- Statusline
    use('nvim-lualine/lualine.nvim')

    -- Colorscheme
    use('navarasu/onedark.nvim')

    -- Syntax highlighting
    use({
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    })

    if packer_bootstrap then
	    require('packer').sync()
    end

end
)

