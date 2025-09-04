return {
	"OXY2DEV/markview.nvim",
	lazy = false,
	priority = 49,
	dependencies = {
		"saghen/blink.cmp",
	},
	config = function()
		require("markview").setup({
            preview = {
                hybrid_modes = { "n" },
                debounce = 5,
            }
		})
	end,
}
