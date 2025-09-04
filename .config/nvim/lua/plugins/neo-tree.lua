return {
	"nvim-neo-tree/neo-tree.nvim",
	opts = {
		close_if_last_window = true,
		window = {
			position = "right",
			width = 30,
			mappings = {
				["l"] = "open",
			},
		},
		buffers = {
			follow_current_file = {
				enabled = true,
			},
		},
		filesystem = {
			follow_current_file = {
				enabled = true,
			},
			filtered_items = {
				visible = true,
				show_hidden_count = true,

				hide_dotfiles = false,
				hide_gitignored = false,
				hide_by_name = {
					"node_modules",
					".DS_Store",
				},
				never_show = {
					".DS_Store",
					"thumbs.db",
				},
				never_show_by_pattern = {
					".null-ls_*",
				},
			},
		},
	},
}
