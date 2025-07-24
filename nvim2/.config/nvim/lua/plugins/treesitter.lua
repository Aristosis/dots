return {
	{
		{
			"nvim-treesitter/nvim-treesitter",
			lazy = false,
			branch = "main",
			build = ":TSUpdate",
			opts = {
				ensure_installed = {
					"lua",
					"vim",
					"vimdoc",
					"markdown",
					"markdown-inline",
				},
			},
		},
		{
			"nvim-treesitter/nvim-treesitter-context",
			opts = { mode = "cursor", max_lines = 1 },
		},
		{
			"windwp/nvim-ts-autotag",
			ft = { "html", "htmx", "js", "ts", "jsx", "tsx" },
			opts = true,
		},

		-- kind of in the same category
		{
			"windwp/nvim-autopairs",
			event = "VeryLazy",
			opts = true,
		},
		{
			"folke/ts-comments.nvim",
			event = "VeryLazy",
			opts = true,
		},
		{
			"nmac427/guess-indent.nvim",
			event = "VeryLazy",
			opts = true,
		},
	},
}
