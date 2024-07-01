return {
	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				columns = { "icon" },
				keymaps = {
					["<C-h>"] = false,
				},
				default_file_explorer = true,
				view_options = {
					show_hidden = true,
					warp = true,
					is_always_hidden = function(name, _)
						return name == ".." or name == ".git"
					end,
				},
			})

			vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })
		end,
	},
}
