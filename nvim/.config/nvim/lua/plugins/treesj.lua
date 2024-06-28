return {
	"Wansmer/treesj",
	dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
	-- stylua: ignore
	keys = {
		{ "<leader>tt", function() require("treesj").toggle() end, desc = "Toggle split line" },
		{ "<leader>tT", function() require("treesj").toggle({ split = { recursive = true } }) end, desc = "Toggle split line recursive" },
	},
	opts = {
		max_join_length = 180,
		use_default_keymaps = false,
	},
}
