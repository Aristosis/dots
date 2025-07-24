return {
	-- disable snacks indent when indent-blankline is enabled
	{
		"lukas-reineke/indent-blankline.nvim",
		opts = {
			indent = {
				char = "│",
				tab_char = "│",
			},
			scope = { show_start = false, show_end = false },
			exclude = {
				filetypes = {
					"Trouble",
					"help",
					"lazy",
					"notify",
					"trouble",
				},
			},
		},
		main = "ibl",
	},
	{
		"catppuccin/nvim",
		lazy = true,
		name = "catppuccin",
		opts = {
			transparent_background = true,
			integrations = {
				blink_cmp = true,
				fzf = true,
				grug_far = true,
				gitsigns = true,
				indent_blankline = { enabled = true },
				lsp_trouble = true,
				markdown = true,
				native_lsp = {
					enabled = true,
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
					},
				},
				notify = true,
				semantic_tokens = true,
				telescope = true,
				treesitter = true,
				treesitter_context = true,
			},
		},
	},
}
