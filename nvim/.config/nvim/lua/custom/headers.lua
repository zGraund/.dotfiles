local headers = {
	-- we can do a bit of trolling
	["vscode"] = {
		logo = {
			"",
			"██╗   ██╗███████╗     ██████╗ ██████╗ ██████╗ ███████╗",
			"██║   ██║██╔════╝    ██╔════╝██╔═══██╗██╔══██╗██╔════╝",
			"██║   ██║███████╗    ██║     ██║   ██║██║  ██║█████╗  ",
			" ██╗ ██╔╝╚════██║    ██║     ██║   ██║██║  ██║██╔══╝  ",
			"  ████╔╝ ███████║    ╚██████╗╚██████╔╝██████╔╝███████╗",
			"  ╚═══╝  ╚══════╝     ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝",
			"                                     ⁽ᵗʰᵉ ᵇᵉˢᵗ ᵉᵈᶦᵗᵒʳ⁾",
		},
		padTop = 6,
		padBot = 2,
	},
	["neovim"] = {
		logo = {
			[[                                                                       ]],
			[[                                                                     ]],
			[[       ████ ██████           █████      ██                     ]],
			[[      ███████████             █████                             ]],
			[[      █████████ ███████████████████ ███   ███████████   ]],
			[[     █████████  ███    █████████████ █████ ██████████████   ]],
			[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
			[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
			[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
			[[                                                                       ]],
		},
		padTop = 6,
		padBot = 2,
	},
}

---Populate table with empty strings
---@param length number
---@return table
local function empty_table(length)
	local empty_tbl = {}
	if length == 0 then
		return empty_tbl
	end
	for _ = 1, length do
		table.insert(empty_tbl, "")
	end
	return empty_tbl
end

---Get the selected header or a random one
---if "random" is used as a name, return the
---first header if name is invalid
---@param name string
---@return table
local function get_header(name)
	local header = {}
	if name == "random" then
		local index = vim.tbl_keys(headers)[math.random(#headers)]
		header = headers[index]
	elseif headers[name] then
		header = headers[name]
	else
		header = headers[0]
	end
	local top = empty_table(header.padTop)
	local bot = empty_table(header.padBot)
	vim.list_extend(top, header.logo)
	vim.list_extend(top, bot)
	return top
end

return { get_header = get_header }
