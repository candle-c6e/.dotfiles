return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dap.adapters.dart = {
				type = "executable",
				command = vim.fn.stdpath("data") .. "/mason/bin/dart-debug-adapter",
				args = { "flutter" },
			}

			dap.adapters.flutter = {
				type = "executable",
				command = vim.fn.stdpath("data") .. "/mason/bin/dart-debug-adapter",
				args = { "flutter" },
			}

			dap.configurations.dart = {
				{
					type = "dart",
					request = "launch",
					name = "Launch dart",
					dartSdkPath = "/Users/candle/fvm/default/bin/cache/dart-sdk/",
					flutterSdkPath = "/Users/candle/fvm/default/",
					program = "${workspaceFolder}/lib/main.dart",
					cwd = "${workspaceFolder}",
				},
				{
					type = "flutter",
					request = "launch",
					name = "Launch flutter",
					dartSdkPath = "/Users/candle/fvm/default/bin/cache/dart-sdk/",
					flutterSdkPath = "/Users/candle/fvm/default/",
					program = "${workspaceFolder}/ecommerce_app/lib/main.dart",
					cwd = "${workspaceFolder}/ecommerce_app/",
				},
			}

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			-- require("dap.ext.vscode").load_launchjs()
		end,
	},
	{
		"leoluz/nvim-dap-go",
		ft = "go",
		dependencies = "mfussenegger/nvim-dap",
		config = function(_, opts)
			require("dap-go").setup(opts)
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			require("dapui").setup({})
		end,
	},
}
