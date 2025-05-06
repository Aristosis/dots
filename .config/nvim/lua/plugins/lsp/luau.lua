local function rojo_project()
	return vim.fs.root(0, function(name)
		return name:match(".+%.project%.json$")
	end)
end

return {
	"lopi-py/luau-lsp.nvim",
	opts = {
		platform = {
			type = rojo_project() and "roblox" or "standard",
		},
		types = {
			roblox_security_level = "PluginSecurity",
		},
		sourcemap = {
			autogenerate = false,
			generatorCommand = "argon",
		},
		plugin = { enabled = true },
		fflags = { enableNewSolver = true },
		server = {
			settings = {
				-- https://github.com/folke/neoconf.nvim/blob/main/schemas/luau_lsp.json
				["luau-lsp"] = {
					hover = { multilineFunctionDefinitions = true },
					completion = {
						autocompleteEnd = true,
						separateGroupsWithLine = true,
						imports = {
							ignoreGlobs = { "**/_Index/**" },
							enabled = true,
						},
					},
				},
			},
		},
	},
}
