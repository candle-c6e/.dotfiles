return {
	{
		"EdenEast/nightfox.nvim",
		config = function()
			local nightfox = require("nightfox")

			nightfox.setup({
				options = {
					dim_inactive = true,
					transparent = true,
				},
			})

			vim.cmd("colorscheme nightfox")
		end,
	},
}
