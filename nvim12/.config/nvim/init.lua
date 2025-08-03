require("opts")
require("keymaps")
require("autocmds")

vim.loader.enable(true)
vim.pack.add({
	{ src = "https://github.com/Saghen/blink.cmp", version = "v1.*" },
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/echasnovski/mini.nvim", version = "main" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/lopi-py/luau-lsp.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
})

vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldmethod = "expr"

require("conform").setup({
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
	formatters_by_ft = {
		lua = { "stylua" },
	},
	notify_no_formatters = false,
})

require("treesitter-context").setup({ mode = "cursor", max_lines = 1 })
require("mini.cursorword").setup()
require("mini.icons").setup()
require("mini.statusline").setup()
-- require("mini.files").setup({ options = { use_as_default_explorer = false } })
require("mini.notify").setup()
require("mini.git").setup()
require("mini.diff").setup()
require("mini.hipatterns").setup()
require("mini.jump").setup()
require("mini.surround").setup()
require("mini.ai").setup()
require("mini.pairs").setup()
require("mini.splitjoin").setup()
require("mini.sessions").setup()

require("oil").setup(require("config.oil"))

require("luau-lsp").setup(require("config.luau-lsp"))
require("blink.cmp").setup(require("config.blink"))
require("fzf-lua").setup(require("config.fzf"))

require("pluginkeymaps")

require("catppuccin").setup({ transparent_background = true })
vim.cmd("colorscheme catppuccin")
