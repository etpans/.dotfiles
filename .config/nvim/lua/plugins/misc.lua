return {
	-- Snippet engine (disabled default <Tab> behavior for now)
	{
		"L3MON4D3/LuaSnip",
		keys = function()
			-- Disable default tab keybinding in LuaSnip
			return {}
		end,
	},

	-- Auto-close and update HTML/JSX tags
	{
		"windwp/nvim-ts-autotag",
		config = true,
	},

	-- Color highlighter (supports Tailwind colors)
	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = {
			user_default_options = {
				tailwind = true,
			},
		},
	},
}
