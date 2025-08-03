vim.lsp.config("luau-lsp", {
	settings = {
		["luau-lsp"] = {
			completion = {
				imports = {
					ignoreGlobs = { "**/_Index/**" },
					enabled = true,
				},
			},
		},
	},
})
