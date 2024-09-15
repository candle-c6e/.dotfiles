return {
	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<C-p>"] = require("telescope.actions.layout").toggle_preview,
						},
					},
					preview = {
						hide_on_startup = true,
					},
					prompt_prefix = "> ",
					selection_caret = "> ",
					entry_prefix = "  ",
					multi_icon = "<>",

					winblend = 0,

					layout_strategy = "horizontal",
					layout_config = {
						width = 0.95,
						height = 0.85,
						prompt_position = "top",

						horizontal = {
							preview_width = function(_, cols, _)
								if cols > 200 then
									return math.floor(cols * 0.4)
								else
									return math.floor(cols * 0.6)
								end
							end,
						},

						vertical = {
							width = 0.9,
							height = 0.95,
							preview_height = 0.5,
						},

						flex = {
							horizontal = {
								preview_width = 0.9,
							},
						},
					},

					selection_strategy = "reset",
					sorting_strategy = "descending",
					scroll_strategy = "cycle",
					color_devicons = true,
				},
				file_previewer = require("telescope.previewers").vim_buffer_cat.new,
				grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
				qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
				history = {
					path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
					limit = 100,
				},
				pickers = {
					find_files = {
						find_command = vim.fn.executable("fdfind") == 1
								and { "fdfind", "--strip-cwd-prefix", "--type", "f" }
							or nil,

						mappings = {
							n = {
								["kj"] = "close",
							},
						},
					},

					git_branches = {
						mappings = {
							i = {
								["<C-a>"] = false,
							},
						},
					},

					buffers = {
						sort_lastused = true,
						sort_mru = true,
					},
				},
				extensions = {
					fzy_native = {
						override_generic_sorter = true,
						override_file_sorter = true,
					},

					fzf_writer = {
						use_highlighter = false,
						minimum_grep_characters = 6,
					},

					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<leader>ps", "<cmd>Telescope live_grep<cr>", {})
			vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
			vim.keymap.set("n", "<leader>ph", builtin.help_tags)
			vim.keymap.set("n", "<C-p>", builtin.git_files, {})
			vim.keymap.set("n", "<C-b>", "<cmd>Telescope buffers<cr>", {})
			vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find)

			require("telescope").load_extension("file_browser")
			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("fzf")
		end,
	},
	"nvim-telescope/telescope-file-browser.nvim",
	"nvim-telescope/telescope-ui-select.nvim",
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
}
