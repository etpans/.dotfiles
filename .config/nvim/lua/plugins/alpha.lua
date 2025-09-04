return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
        local ascii = require("ascii.neko")

		-- Header (ASCII Art)
		dashboard.section.header.val = vim.split(ascii, "\n", {})

		-- Buttons (updated icons to Nerd Fonts v3)
		dashboard.section.buttons.val = {
			dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "󰍉  find file", ":Telescope find_files<CR>"),
			dashboard.button("r", "󰄉  Recent", ":Telescope oldfiles<CR>"),
			dashboard.button("s", "  Settings", ":e $MYVIMRC | Neotree toggle dir=~<CR>"),
			dashboard.button("q", "󰅚  Quit NVIM", ":qa<CR>"),
		}

		dashboard.section.footer.val = { "", "configured by pans." }

		alpha.setup(dashboard.opts)

		-- vim.api.nvim_create_autocmd("FileType", {
		-- 	pattern = "alpha",
		-- 	callback = function()
		-- 		vim.opt.showtabline = 0
		--
		-- 		vim.api.nvim_create_autocmd("BufUnload", {
		-- 			buffer = 0,
		-- 			callback = function()
		-- 				vim.opt.showtabline = 2
		-- 			end,
		-- 		})
		-- 	end,
		-- })
	end,
}
