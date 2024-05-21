return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	event = "VimEnter",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	-- cmd = { "Neotree" },
	keys = {
		{ "\\", "<Cmd>Neotree toggle<CR>", { silent = true, desc = "NeoTree toggle" } },
	},
	opts = {
		close_if_last_window = true,
		window = {
			mappings = {
				-- ["<space>"] = {
				-- 	nowait = true,
				-- },
			},
		},
		filesystem = {
			filtered_items = {
				visible = false,
				hide_dotfiles = false,
				hide_by_name = {
					"node_modules",
					".git",
				},
				always_show = {
					".gitignored",
				},
			},
			follow_current_file = {
				enabled = true, -- This will find and focus the file in the active buffer every time
				leave_dirs_open = true, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
			},
			hijack_netrw_behavior = "open_current",
			group_empty_dirs = true,
		},
	},
}
