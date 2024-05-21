local function printTable(tbl, indent)
	indent = indent or 0
	local indentStr = string.rep("  ", indent)

	for key, value in pairs(tbl) do
		if type(value) == "table" then
			print(indentStr .. key .. " = {")
			printTable(value, indent + 1)
			print(indentStr .. "}")
		else
			print(indentStr .. key .. " = " .. tostring(value))
		end
	end
end

return {
	printTable = printTable,
}
