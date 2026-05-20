return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		local ascii = require("config.ascii")

		dashboard.section.header.val = vim.split(ascii.usagi, "\n", {})

		local startup_dir = vim.loop.cwd()
		dashboard.section.buttons.val = {
			dashboard.button("n", " New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("s", "󰍉 Search file", ":Telescope find_files<CR>"),
			dashboard.button("w", "󰝒 Workspace", function()
				if startup_dir and vim.fn.isdirectory(startup_dir) == 1 then
					vim.cmd("cd " .. startup_dir)
					require("neo-tree.command").execute({
						toggle = true,
						dir = startup_dir,
					})
				else

					vim.notify("Startup directory not found", vim.log.levels.WARN)
				end
			end),
			dashboard.button("r", "󰄉 Recent", ":Telescope oldfiles<CR>"),
			dashboard.button("c", " Config", function()
				vim.cmd("edit $MYVIMRC")
				require("neo-tree.command").execute({ toggle = true, dir = vim.fn.expand("~") })
			end),
			dashboard.button("q", "󰅚 Quit NVIM", ":qa<CR>"),
		}

		dashboard.section.footer.val = { "", "configured by pans." }
		alpha.setup(dashboard.opts)

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "alpha",
			callback = function()
				vim.opt.showtabline = 0
				vim.api.nvim_create_autocmd("BufUnload", {

					buffer = 0,
					callback = function()
						vim.opt.showtabline = 2
					end,
				})
			end,
		})

		-- vim.keymap.set("n", "<leader>da", function()
		-- 	if vim.bo.filetype == "neo-tree" then
		-- 		vim.cmd("Neotree close")
		-- 		vim.cmd("wincmd p")
		-- 	end
		-- 	vim.cmd("Alpha")
		-- end, { silent = true, desc = "Dashboard (Alpha)" })
	end,
}

