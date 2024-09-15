return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function(opts)
      require("tokyonight").setup({
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        }
      })

      vim.cmd [[colorscheme tokyonight]]
    end
  },
  -- {
  -- 	"rose-pine/neovim",
  -- 	name = "rose-pine",
  -- 	config = function()
  -- 		require("rose-pine").setup({
  -- 			disable_background = true,
  -- 			styles = {
  -- 				italic = false,
  -- 			},
  -- 		})
  --
  -- 		vim.cmd.colorscheme("rose-pine-moon")
  --
  -- 		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  -- 		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  -- 	end,
  -- },
  -- {
  -- 	"EdenEast/nightfox.nvim",
  -- 	config = function()
  -- 		local nightfox = require("nightfox")
  --
  -- 		nightfox.setup({
  -- 			options = {
  -- 				dim_inactive = true,
  -- 			},
  -- 		})
  --
  -- 		vim.cmd("colorscheme nightfox")
  -- 	end,
  -- },
  -- {
  -- 	"catppuccin/nvim",
  -- 	name = "catppuccin",
  -- 	priority = 1000,
  -- 	opts = {
  -- 		term_colors = true,
  -- 		transparent_background = true,
  -- 		color_overrides = {
  -- 			mocha = {
  -- 				base = "#1e2030",
  -- 				mantle = "#1e2030",
  -- 				crust = "#1e2030",
  -- 			},
  -- 		},
  -- 		integrations = {
  -- 			telescope = {
  -- 				enabled = true,
  -- 				style = "nvchad",
  -- 			},
  -- 			dropbar = {
  -- 				enabled = true,
  -- 				color_mode = true,
  -- 			},
  -- 		},
  -- 	},
  -- 	config = function(_, opts)
  -- 		require("catppuccin").setup(opts)
  --
  -- 		local cmp = require("cmp")
  --
  -- 		vim.api.nvim_set_hl(0, "MyPmenuSel", { bg = "#1a1b26", fg = "#c0caf5", bold = true })
  --
  -- 		cmp.setup({
  -- 			window = {
  -- 				completion = {
  -- 					winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:MyPmenuSel,Search:None",
  -- 					col_offset = -3,
  -- 					side_padding = 0,
  -- 				},
  -- 			},
  -- 		})
  --
  -- 		vim.cmd([[colorscheme catppuccin]])
  -- 	end,
  -- },
}
