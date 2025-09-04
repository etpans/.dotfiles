return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			transparent_background = true,
			float = {
				transparent = true,
				solid = true,
			},
			auto_integrations = true,
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
