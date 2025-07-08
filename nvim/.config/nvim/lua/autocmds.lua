local autocmd = vim.api.nvim_create_autocmd

-- Highlight yank
vim.api.nvim_create_augroup("Extras", { clear = true })
autocmd("TextYankPost", {
	group = "Extras",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ timeout = 100 })
	end,
})

