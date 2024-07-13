-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd(
	-- taken from LunarVim <3
	{ "BufRead", "BufWinEnter", "BufNewFile" },
	{
		group = vim.api.nvim_create_augroup("_file_opened", { clear = true }),
		nested = true,
		callback = function(args)
			local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })
			if not (vim.fn.expand("%") == "" or buftype == "nofile") then
				vim.api.nvim_del_augroup_by_name("_file_opened")
				vim.api.nvim_exec_autocmds("User", { pattern = "FileOpened" })
			end
		end,
	}
)
