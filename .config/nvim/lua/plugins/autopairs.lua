return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = function(_, opts)
		local Rule = require("nvim-autopairs.rule")
		local npairs = require("nvim-autopairs")

		npairs.setup(opts)

		-- Custom rules for Markdown
		npairs.add_rules({
			Rule("*", "*", "markdown"),
			Rule("_", "_", "markdown"),
		})
	end,
	opts = {},
}
