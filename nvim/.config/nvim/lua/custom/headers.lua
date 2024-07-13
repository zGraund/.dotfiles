local headers = {
	-- we do a bit of trolling
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
---@diagnostic disable-next-line: unused-function, unused-local
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

---Insert pad top and bottom in a list-like table
---the pad is a 0 len string
---@param dest table
---@param top number
---@param bot number
local function pad_list(dest, top, bot)
	for _ = 1, top do
		table.insert(dest, 1, "")
	end
	for _ = 1, bot do
		table.insert(dest, "")
	end
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
		-- i couldn't find a better way to get the first entry in the table
		for _, h in pairs(headers) do
			header = h
			break
		end
	end
	pad_list(header.logo, header.padTop, header.padBot)
	return header.logo
end

return { get_header = get_header }
