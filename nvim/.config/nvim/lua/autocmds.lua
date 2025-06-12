local autocmd = vim.api.nvim_create_autocmd
local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })

-- When cursor stops moving: Highlights all instances of the symbol under the cursor
-- When cursor moves: Clears the highlighting
-- autocmd({ 'CursorHold', 'CursorHoldI' }, {
-- 	group = highlight_augroup,
-- 	callback = vim.lsp.buf.document_highlight,
-- })
-- autocmd({ 'CursorMoved', 'CursorMovedI' }, {
-- 	group = highlight_augroup,
-- 	callback = vim.lsp.buf.clear_references,
-- })
--
-- -- When LSP detaches: Clears the highlighting
-- autocmd('LspDetach', {
-- 	group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
-- 	callback = function(event2)
-- 		vim.lsp.buf.clear_references()
-- 		vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
-- 	end,
-- })
--
-- Highlight yank
vim.api.nvim_create_augroup("Extras", { clear = true })
autocmd("TextYankPost", {
	group = "Extras",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ timeout = 100 })
	end,
})


