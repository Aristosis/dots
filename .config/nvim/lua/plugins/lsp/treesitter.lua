return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			indent = { enabled = true },
			ensure_installed = {
				"lua",
				"luau",
				"go",
				"js",
				"md",
				"c",
				"html",
				"python",
			},
		},
	},
}
