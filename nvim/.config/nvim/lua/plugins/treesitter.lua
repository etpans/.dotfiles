return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {

		ensure_installed = {
			"lua",
			"python",
			"javascript",
			"typescript",
			"json",
			"java",
			"gitignore",
			"markdown",
			"markdown_inline",
			"css",
			"html",
		},
		auto_install = true,
		highlight = { enable = true },
		indent = { enable = true },
	},
}


