return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = { "VeryLazy" },
	opts = {
		options = {
			-- theme = "tokyonight",
			globalstatus = false,
			disabled_filetypes = { statusline = { "dashboard" } },
		},
		sections = {
			-- lualine_a = {
			-- 	{
			-- 		require("noice").api.status.mode.get,
			-- 		cond = require("noice").api.status.mode.has,
			-- 		color = { fg = "#ff9e64" },
			-- 	},
			-- 	{
			-- 		require("noice").api.status.command.get,
			-- 		cond = require("noice").api.status.command.has,
			-- 		color = { fg = "#ff9e64" },
			-- 	},
			-- },
			lualine_c = { { "filename", path = 1 } },
			-- lualine_x = { "encoding", "buffers", "filetype" },
			lualine_x = { "encoding", "filetype" },
			lualine_y = { "selectioncount", "progress" },
			lualine_z = { "searchcount", "location" },
		},
		extensions = { "lazy", "mason", "neo-tree" },
	},
}
