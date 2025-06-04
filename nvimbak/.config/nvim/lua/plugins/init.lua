return {
	require("plugins.lsp.blink"),
	require("plugins.lsp.mason"),
	require("plugins.lsp.nvim-lspconfig"),
	require("plugins.lsp.treesitter"),
	require("plugins.lsp.luau"),
	require("plugins.lsp.lazydev"),

	require("plugins.fmt-lint-snip.lint"),
	require("plugins.fmt-lint-snip.conform"),

	require("plugins.utils.autopairs"),
	require("plugins.utils.harpoon"),
	require("plugins.utils.mini"),
	require("plugins.utils.snacks"),
	require("plugins.utils.surround"),
	require("plugins.utils.ufo"),
	require("plugins.utils.markdown"),

	require("plugins.ui.oil"),
	require("plugins.ui.colorizer"),
	-- require("plugins.ui.kanagawa"),
	require("plugins.ui.tokyonight"),
	require("plugins.ui.gitsigns"),
	require("plugins.ui.todo-comments"),
	require("plugins.ui.lualine"),
}
