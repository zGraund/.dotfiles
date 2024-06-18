return {
	"lukas-reineke/indent-blankline.nvim",
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
			exclude = { filetypes = { "dashboard" } },
			scope = { highlight = highlight },
			indent = { char = "│" },
		})
		hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
		require("rainbow-delimiters.setup").setup({ highlight = highlight })
	end,
}
