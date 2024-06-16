return {
	"Wansmer/treesj",
	keys = { "<leader>tt", "<leader>tT" },
	dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
	config = function()
		require("treesj").setup({ use_default_keymaps = false })

		vim.keymap.set("n", "<leader>tt", require("treesj").toggle, { desc = "Toggle split line" })
		vim.keymap.set("n", "<leader>tT", function()
			require("treesj").toggle({ split = { recursive = true } })
		end, { desc = "Toggle split line recursive" })
	end,
}
