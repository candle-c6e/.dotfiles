return {
	"mrcjkb/rustaceanvim",
	version = "^5", -- Recommended
	lazy = false, -- This plugin is already lazy
	config = function()
		vim.g.rustaceanvim = {
			server = {
				on_attach = function(client, bufnr) end,
				default_settings = {
					["rust-analyzer"] = {
						rustfmt = {
							overrideCommand = { "leptosfmt", "--stdin", "--rustfmt" },
						},
						procMacro = {
							ignored = {
								leptos_macro = {
									-- "component",
									"server",
								},
							},
						},
						cargo = {
							allFeatures = true,
						},
					},
				},
			},
		}
	end,
}
