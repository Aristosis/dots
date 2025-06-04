return {
	"saghen/blink.cmp",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
	},
	version = "*",
	opts = {
		signature = {
			window = {
				show_documentation = false,
				border = "single",
			},
			enabled = true,
		},
		completion = {
			documentation = {
				window = { border = "single" },
				auto_show = true,
				auto_show_delay_ms = 500,
			},
			menu = {
				draw = {
					components = {
						kind_icon = {
							ellipsis = false,
							text = function(ctx)
								local lspkind = require("lspkind")
								local icon = ctx.kind_icon
								if vim.tbl_contains({ "Path" }, ctx.source_name) then
									local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
									if dev_icon then icon = dev_icon end
								else
									icon = lspkind.symbolic(ctx.kind, {
										mode = "symbol",
									})
								end

								return icon .. ctx.icon_gap
							end,

							-- Optionally, use the highlight groups from nvim-web-devicons
							-- You can also add the same function for `kind.highlight` if you want to
							-- keep the highlight groups in sync with the icons.
							highlight = function(ctx)
								local hl = ctx.kind_hl
								if vim.tbl_contains({ "Path" }, ctx.source_name) then
									local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
									if dev_icon then hl = dev_hl end
								end
								return hl
							end,
						},
					},
					treesitter = { "lsp" },
					columns = { { "kind_icon", "label", gap = 1 }, { "kind" } },
				},
			},
		},
		keymap = {
			preset = "default",
			["<C-e>"] = { "select_and_accept", "fallback" },
			["<C-y>"] = { "select_and_accept", "fallback" },
			["<C-space>"] = { "show", "show_documentation", "hide", "hide_documentation" },
		},
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "normal",
		},
		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					-- make lazydev completions top priority (see `:h blink.cmp`)
					score_offset = 100,
				},
				path = { opts = {
					get_cwd = function(_) return vim.fn.getcwd() end,
				} },
			},
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
},
