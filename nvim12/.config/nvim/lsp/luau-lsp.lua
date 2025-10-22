vim.lsp.config("luau-lsp", {
	capabilities = {
		workspace = {
			didChangeWatchedFiles = {
				dynamicRegistration = true,
			},
		},
	},
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
