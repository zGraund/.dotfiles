--[[
--	TABLE FORMAT
--	<language> = {
--		lsp = {
--			"<lsp_server>" = {
--				cmd = { ... },          - Override the default command used to start the server
--				filetypes = { ... },    - Override the default list of associated filetypes for the server
--				capabilities = { ... }, - Override fields in capabilities. Can be used to disable certain LSP features.
--				settings = { ... },     - Override the default settings passed when initializing the server.
--			}
--		},
--		formatters = { "<formatter_1>", "<formatter_2>" },
--		linters = { "<linter>" },
--		dap = { "<dap_server>" },
--	}
--]]
local tools_by_filetypes = {
	lua = {
		lsp = {
			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			},
		},
		formatters = { "stylua" },
		linters = {},
	},
	go = {
		lsp = {
			gopls = {
				settings = {
					gopls = {
						-- semanticTokens = false,
						usePlaceholders = true,
						analyses = {
							shadow = true,
							unusedvariable = true,
						},
					},
				},
			},
		},
		formatters = { "goimports", "gofumpt" },
		linters = { "golangcilint" },
	},
}

local map_to_mason = {
	golangcilint = "golangci-lint",
}

local function get_to_install()
	local tools_to_install = {}
	for _, tools in pairs(tools_by_filetypes) do
		if tools.lsp then
			vim.list_extend(tools_to_install, vim.tbl_keys(tools.lsp))
		end
		if tools.formatters then
			vim.list_extend(tools_to_install, vim.tbl_flatten(tools.formatters))
		end
		if tools.linters then
			vim.list_extend(tools_to_install, tools.linters)
		end
		if tools.dap then
			vim.list_extend(tools_to_install, tools.dap)
		end
	end
	for i, value in pairs(tools_to_install) do
		local mapped = map_to_mason[value]
		if mapped then
			tools_to_install[i] = mapped
		end
	end
	return tools_to_install
end

local function get_tools_by_ft(wanted)
	local result = {}
	for ft, tools in pairs(tools_by_filetypes) do
		if tools[wanted] and next(tools[wanted]) ~= nil then
			result[ft] = vim.tbl_deep_extend("force", {}, tools[wanted])
		end
	end
	return result
end

return {
	get_tools_by_ft = get_tools_by_ft,
	get_to_install = get_to_install,
}
