return {
	"folke/tokyonight.nvim",
	priority = 1000, -- Make sure to load this before all the other start plugins.
	opts = {
		style = "night",
		transparent = true,
		styles = {
			sidebars = "transparent",
		},
		on_colors = function(c)
			local util = require("tokyonight.util")
			local border = "#565f89"

			c.gitSigns = {
				add = c.green,
				delete = c.red1,
				change = c.git.change,
			}

			c.git.add = c.green
			c.git.delete = c.red1
			-- c.git.change = c.yellow

			c.diff = {
				-- add = util.darken(c.green, 0.5),
				add = "#144200",
				change = util.darken(c.blue, 0.5),
				-- delete = util.darken(c.red1, 0.6),
				delete = "#3D0C0C",
				text = c.diff.text,
			}

			c.border = border
			c.border_highlight = border
		end,
		on_highlights = function(hl, _)
			hl["@keyword.import"] = hl["@keyword"]
			hl.MatchParen = {
				bold = true,
			}
		end,
	},
	init = function()
		vim.cmd.colorscheme("tokyonight-night")
		-- You can configure highlights by doing something like:
		-- vim.cmd.hi("Comment gui=none")
	end,
}
