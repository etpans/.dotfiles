return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		messages = {
			view_error = "notify",
			view_warn = "notify",
			view_history = "messages",
		},
		notify = { enabled = true },
		history = { view = "split" },
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		{
			"rcarriga/nvim-notify",
			opts = {
				timeout = 2500,
				stages = "fade",
				top_down = false,
				render = "minimal",
			},
		},
	},
	keys = {
		{
			"<leader>nv",
			function()
				vim.cmd("messages")
			end,
			desc = "[N]otify [V]iew",
		},
		{
			"<leader>nd",
			function()
				require("notify").dismiss({ silent = true, pending = true })
			end,
			desc = "[N]otify [D]ismiss",
		},
	},
}
