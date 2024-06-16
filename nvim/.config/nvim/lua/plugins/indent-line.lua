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
		require("ibl").setup({
			exclude = { filetypes = { "dashboard" } },
			scope = { highlight = highlight },
		})
		require("rainbow-delimiters.setup").setup({ highlight = highlight })
	end,
}
