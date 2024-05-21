return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("dashboard").setup({
			theme = "hyper",
			config = {
				week_header = {
					enable = true,
				},
				shortcut = {
					{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
					{
						icon = " ",
						icon_hl = "@variable",
						desc = "Files",
						group = "Label",
						action = "Telescope find_files",
						key = "f",
					},
					{
						desc = " Apps",
						group = "DiagnosticHint",
						action = "",
						key = "a",
					},
					{
						desc = " dotfiles",
						group = "Number",
						action = function()
							vim.cmd.cd("~/.dotfiles/")
							vim.cmd("Neotree current")
						end,
						key = "d",
					},
				},
			},
		})
	end,
}
