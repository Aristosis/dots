-- Enabling lsps
vim.lsp.enable {
	"lua_ls",
	"zls",
	"pyright",
	"gopls"
}

--[[
	Diagnostics and LSP
]]

-- Diagnostic Signs
local symbols = {
	VirtualTextPrefix = "● ",
	Error = "󰅙 ",
	Info = "󰋼 ",
	Hint = "󰌵 ",
	Warn = " "
}

local s = vim.diagnostic.severity

vim.diagnostic.config {
	severity_sort = true,
	float = {
		border = "rounded",
		source = true
	},
	virtual_text = {
		prefix = symbols.VirtualTextPrefix,
	},
	signs = {
		text = {
			[s.ERROR] = symbols.Error,
			[s.WARN] = symbols.Warn,
			[s.INFO] = symbols.Info,
			[s.HINT] = symbols.Hint,
		},
	},
}
