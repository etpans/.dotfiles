return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				svelte = { "prettierd" },
				css = { "prettierd" },
				html = { "prettierd" },
				json = { "prettierd" },
				yaml = { "prettierd" },
				markdown = { "prettierd" },
				graphql = { "prettierd" },
				liquid = { "prettierd" },
				lua = { "stylua" },
				python = { "isort", "black" },
				java = { "google-java-format" },
			},
			formatters = {
				isort = {
					command = "/mnt/c/Users/Evan/AppData/Local/Programs/Python/Python313/Scripts/isort.exe",
				},
				black = {
					command = "/mnt/c/Users/Evan/AppData/Local/Programs/Python/Python313/Scripts/black.exe",
				},
				["google-java-format"] = {
					command = "java",
					args = {
						"-jar",
						"/home/evan/.local/share/google-java-format-1.28.0-all-deps.jar",
						"--aosp",
						"-", -- `-` means read from stdin (needed for nvim integration)
					},

					stdin = true,
				},
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 3000,
			},
		})
	end,
}
