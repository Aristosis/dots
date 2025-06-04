return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"folke/lazydev.nvim",
		"saghen/blink.cmp",
	},
	opts = {
		servers = {
			lua_ls = {
				settings = {
					runtime = {
						path = { "?.lua", "?/init.lua" },
						pathStrict = true,
						version = "LuaJIT",
					},
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
							"${3rd}/luv/library",
						},
					},
				},
			},
			pyright = {},
			gopls = {},
			gdscript = {},
		},
	},
	config = function(_, opts)
		local lspconfig = require("lspconfig")
		for server, config in pairs(opts.servers) do
			config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
			lspconfig[server].setup(config)
		end
	end,
}
