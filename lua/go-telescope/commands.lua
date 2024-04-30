local M = {}
M.commands = {
	{
		label = "Go Mod Tidy",
		desc = "Clean up the Go module",
		func = function()
			vim.cmd("GoModTidy")
		end,
	},
	{
		label = "Go Build",
		desc = "Build the Go project",
		func = function()
			vim.cmd("GoBuild")
		end,
	},
}
return M
