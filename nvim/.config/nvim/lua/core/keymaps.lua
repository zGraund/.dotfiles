-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Keymaps from the vim goat ThePrimeagen
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without copying selection" })

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+y$]], { desc = "Yank to end of line to system clipboard" })

vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without copying" })
-- vim.keymap.set("n", "<leader>D", '"_D', { desc = { "Delete to end of line without copying" } })

-- Append or prepend empty line(s)
vim.keymap.set(
	"n",
	"]<leader>",
	'<Cmd>call append(line("."), repeat([""], v:count1))<CR>',
	{ silent = true, desc = "Insert [count] line(s) after the cursor" }
)
vim.keymap.set(
	"n",
	"[<leader>",
	'<Cmd>call append(line(".") - 1, repeat([""], v:count1))<CR>',
	{ silent = true, desc = "Insert [count] line(s) before the cursor" }
)

-- Random utils
vim.keymap.set("n", "<leader>x", "<Cmd>source %<CR>", { silent = true, desc = "Execute current file" })

-- Buffer movement
vim.keymap.set("n", "[b", "<Cmd>bprevious<CR>", { silent = true, desc = "Go to previous buffer" })
vim.keymap.set("n", "]b", "<Cmd>bnext<CR>", { silent = true, desc = "Go to next buffer" })
vim.keymap.set("n", "[B", "<Cmd>bfirst<CR>", { silent = true, desc = "Go to first buffer" })
vim.keymap.set("n", "]B", "<Cmd>blast<CR>", { silent = true, desc = "Go to last buffer" })

-- Location list
vim.keymap.set("n", "[l", "<Cmd>lprevious<CR>", { silent = true, desc = "Go to previous location list" })
vim.keymap.set("n", "]l", "<Cmd>lnext<CR>", { silent = true, desc = "Go to next location list" })
vim.keymap.set("n", "[L", "<Cmd>lfirst<CR>", { silent = true, desc = "Go to first location list" })
vim.keymap.set("n", "]L", "<Cmd>llast<CR>", { silent = true, desc = "Go to last location list" })

-- Quickfix list
vim.keymap.set("n", "[q", "<Cmd>cprevious<CR>", { silent = true, desc = "Go to previous Quickfix list" })
vim.keymap.set("n", "]q", "<Cmd>cnext<CR>", { silent = true, desc = "Go to next Quickfix list" })
vim.keymap.set("n", "[Q", "<Cmd>cfirst<CR>", { silent = true, desc = "Go to first Quickfix list" })
vim.keymap.set("n", "]Q", "<Cmd>clast<CR>", { silent = true, desc = "Go to last Quickfix list" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Keybinds to make split navigation easier.
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
