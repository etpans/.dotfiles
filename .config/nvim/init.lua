require("core.options")
require("core.keymaps")
require("core.autocmds")

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

vim.opt.rtp:prepend(lazypath)

local startup_cwd = vim.fn.getcwd()

-- When Alpha opens, reset the cwd back to startup_cwd
vim.api.nvim_create_autocmd("User", {

	pattern = "AlphaReady",
	callback = function()
		vim.cmd("cd " .. startup_cwd)
	end,
})

-- [[ Configure and install plugins
require("lazy").setup({
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	},

	require("plugins.colortheme"),
	require("plugins.lualine"),
	require("plugins.alpha"),
	require("plugins.bufferline"),
	require("plugins.neo-tree"),
	require("plugins.treesitter"),
	require("plugins.telescope"),
	require("plugins.lsp"),
	require("plugins.autocompletion"),
	require("plugins.indent-blankline"),
	require("plugins.misc"),
	require("plugins.formatter"),
	require("plugins.comment"),
	require("plugins.tabout"),
	require("plugins.autopairs"),
	require("plugins.markdown-preview"),
	require("plugins.noice"),
	-- require("plugins.render-markdown"),
    require("plugins.markview"),
	require("plugins.which-key"),
    require("plugins.mini-surround"),
})
