return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			-- theme = "tokyonight",
			globalstatus = false,
		},
		sections = {
			lualine_c = { { "filename", path = 1 } },
			-- lualine_x = { "encoding", "buffers", "filetype" },
			lualine_x = { "encoding", "filetype" },
			lualine_y = { "selectioncount", "progress" },
			lualine_z = { "searchcount", "location" },
		},
		extensions = { "lazy", "mason", "neo-tree" },
	},
}
