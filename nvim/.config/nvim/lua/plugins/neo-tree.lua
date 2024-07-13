return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	cmd = "Neotree",
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
				["Y"] = {
					function(state)
						local node = state.tree:get_node()
						local path = node:get_id()
						vim.fn.setreg("+", path, "c")
					end,
					desc = "Copy Path to Clipboard",
				},
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
	init = function()
		-- Lazy load neo-tree unless nvim is opened in a directory (copied from folke)
		vim.api.nvim_create_autocmd("BufEnter", {
			group = vim.api.nvim_create_augroup("Neotree_start_directory", { clear = true }),
			desc = "Start Neo-tree with directory",
			once = true,
			callback = function()
				if package.loaded["neo-tree"] then
					return
				else
					---@diagnostic disable-next-line: param-type-mismatch
					local stats = vim.uv.fs_stat(vim.fn.argv(0))
					if stats and stats.type == "directory" then
						require("neo-tree")
					end
				end
			end,
		})
	end,
}
