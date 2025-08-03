return {
	fuzzy = {
		prebuilt_binaries = { force_version = "v1.6.0" },
	},
	completion = {
		menu = {
			draw = {
				columns = {
					{ "kind_icon", "label", "label_description", gap = 1 },
					{ "kind" },
				},
				components = {
					kind_icon = {
						text = function(ctx)
							local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
							return kind_icon
						end,
						highlight = function(ctx)
							local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
							return hl
						end,
					},
					kind = {
						highlight = function(ctx)
							local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
							return hl
						end,
					},
				},
			},
		},
	},
}
