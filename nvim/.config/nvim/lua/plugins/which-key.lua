return {
	-- Useful plugin to show you pending keybinds.
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "classic",
		win = { border = "rounded" },
		expand = 0,
		spec = {
			-- Document existing key chains
			{ "<leader>c", group = "[C]ode" },
			{ "<leader>d", group = "[D]ocument" },
			{ "<leader>h", group = "Git [H]unk" },
			{ "<leader>r", group = "[R]ename" },
			{ "<leader>s", group = "[S]earch" },
			{ "<leader>t", group = "[T]oggle" },
			{ "<leader>w", group = "[W]orkspace" },

			-- visual mode
			{ "<leader>h", desc = "Git [H]unk", mode = "v" },
		},
	},
}
