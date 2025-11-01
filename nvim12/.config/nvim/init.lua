require("opts")
require("keymaps")
require("autocmds")

vim.loader.enable(true)
vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim" },

	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/Saghen/blink.cmp", version = "v1.*" },
	{ src = "https://github.com/aristosis/grapple.nvim" },
	{ src = "https://github.com/mini-nvim/mini.nvim", version = "main" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/stevearc/conform.nvim" },

	{ src = "https://github.com/lopi-py/luau-lsp.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },

	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
})

vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldmethod = "expr"

require("treesitter-context").setup({ mode = "cursor", max_lines = 1 })

require("nvim-web-devicons").setup()
require("mini.cursorword").setup()
require("mini.statusline").setup()
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

require("tiny-inline-diagnostic").setup(require("config.tiny-inline-diagnostic"))

require("oil").setup(require("config.oil"))
require("luau-lsp").setup(require("config.luau-lsp"))
require("blink.cmp").setup(require("config.blink"))
require("fzf-lua").setup(require("config.fzf"))
require("render-markdown").setup(require("config.render-markdown"))
require("conform").setup(require("config.conform"))
require("grapple").setup(require("config.grapple"))
require("catppuccin").setup({ transparent_background = true })

vim.cmd("colorscheme catppuccin")

require("pluginkeymaps")
