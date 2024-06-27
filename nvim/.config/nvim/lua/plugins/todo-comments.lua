return {
	-- Highlight todo, notes, etc in comments
	"folke/todo-comments.nvim",
	event = "BufEnter",
	cmd = { "TodoTrouble", "TodoTelescope" },
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
	-- stylua: ignore
	keys = {
		{ "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
		{ "[t", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
		{ "<leader>st", "<cmd>TodoTelescope<cr>", desc = "[S]earch [T]odo" },
		{ "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "[S]earch Todo/Fix/Fixme" },
	},
}
