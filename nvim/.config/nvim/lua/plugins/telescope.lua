local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local themes = require("telescope.themes")

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	cmd = { "Telescope" },
	opts = {
		-- See `:help telescope` and `:help telescope.setup()`
		defaults = {
			mappings = {
				i = {
					["<C-enter>"] = actions.to_fuzzy_refine,
					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
					["<C-p>"] = actions.cycle_history_prev,
					["<C-n>"] = actions.cycle_history_next,
					["<c-x>"] = actions.delete_buffer + actions.move_to_top,
				},
				n = {
					["<c-x>"] = actions.delete_buffer,
				},
			},
			file_ignore_patterns = {
				".git",
			},
		},
		-- pickers = {}
		-- extensions = {},
	},
	keys = {
		-- See `:help telescope.builtin`
		{ "<leader>sh", builtin.help_tags, desc = "[S]earch [H]elp" },
		{ "<leader>sk", builtin.keymaps, desc = "[S]earch [K]eymaps" },
		{ "<leader>sf", builtin.find_files, desc = "[S]earch [F]iles" },
		{
			"<leader>sa",
			function()
				builtin.find_files({ hidden = true, no_ignore = true })
			end,
			desc = "[S]earch [A]ll files",
		},
		{ "<leader>ss", builtin.builtin, desc = "[S]earch [S]elect Telescope" },
		{ "<leader>sw", builtin.grep_string, desc = "[S]earch current [W]ord" },
		{ "<leader>sg", builtin.live_grep, desc = "[S]earch by [G]rep" },
		{ "<leader>sd", builtin.diagnostics, desc = "[S]earch [D]iagnostics" },
		{ "<leader>sr", builtin.resume, desc = "[S]earch [R]esume" },
		{ "<leader>s.", builtin.oldfiles, desc = '[S]earch Recent Files ("." for repeat)' },
		{ "<leader><leader>", builtin.buffers, desc = "[ ] Find existing buffers" },
		{
			"<leader>/",
			function()
				builtin.current_buffer_fuzzy_find(themes.get_dropdown({ winblend = 10, previewer = false }))
			end,
			desc = "[/] Fuzzily search in current buffer",
		},
		{
			"<leader>s/",
			function()
				builtin.live_grep({ grep_open_files = true, prompt_title = "Live Grep in Open Files" })
			end,
			desc = "[S]earch [/] in Open Files",
		},
		{
			"<leader>sn",
			function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "[S]earch [N]eovim files",
		},
	},
	config = function(_, opts)
		local telescope = require("telescope")

		telescope.setup(opts)

		-- Enable Telescope extensions if they are installed
		pcall(telescope.load_extension, "fzf")
	end,
}
