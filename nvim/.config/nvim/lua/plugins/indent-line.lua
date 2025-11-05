return {
	"lukas-reineke/indent-blankline.nvim",
	event = "User FileOpened",
	dependencies = {
		"HiPhish/rainbow-delimiters.nvim",
	},
	main = "ibl",
	config = function()
		local highlight = {
			"RainbowDelimiterYellow",
			"RainbowDelimiterViolet",
			"RainbowDelimiterBlue",
			-- "RainbowDelimiterOrange",
			-- 'RainbowDelimiterRed',
			-- "RainbowDelimiterCyan",
			-- 'RainbowDelimiterGreen',
		}
		local hooks = require("ibl.hooks")
		require("ibl").setup({
			-- exclude = { filetypes = { "dashboard" } },
			exclude = {
				filetypes = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
				},
			},
			scope = {
				show_start = false,
				show_end = false,
				highlight = highlight,
			},
			indent = { char = "│" },
		})
		hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
		require("rainbow-delimiters.setup").setup({ highlight = highlight })
	end,
}
