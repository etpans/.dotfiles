return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local hide_in_width = function()
			return vim.fn.winwidth(0) > 100
		end

		require("lualine").setup({
			options = {
				icons_enabled = true,
				disabled_filetypes = { "alpha", "Avante" },
				always_divide_middle = true,
				globalstatus = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = {
					{
						"filename",
						file_status = true,
						path = 2,
						fmt = function(str)
							return str:gsub(vim.fn.expand("$HOME"), "~")
						end,
					},
				},
				lualine_x = {
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						sections = { "error", "warn" },
						symbols = { error = " ", warn = " ", info = " ", hint = " " },
						colored = false,
						update_in_insert = false,
						always_visible = false,
						cond = hide_in_width,
					},
					{
						"diff",
						colored = false,
						symbols = { added = " ", modified = " ", removed = " " },
						cond = hide_in_width,
					},
					{ "encoding", cond = hide_in_width },
					{ "filetype", cond = hide_in_width },
				},
				lualine_y = { "location" },
				lualine_z = { "progress" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "filename", path = 1 } },
				lualine_x = { { "location", padding = 0 } },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = { "fugitive" },
		})
	end,
}
