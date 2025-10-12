return { {
	'lukas-reineke/indent-blankline.nvim',
	main = 'ibl',
	-- @module "ibl"
	-- @type "ibl.config"
	opts = {},
	init = function()
		require'ibl'.setup()
	end
} }
