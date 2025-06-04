--[[
Autocommands for core functionality are created here
Plugin specific binds and autocmds are in or near their specs
]]
local autocmd = vim.api.nvim_create_autocmd
local fn = vim.fn

vim.api.nvim_create_augroup("Extras", { clear = true })

-- Highlight on yank
autocmd("TextYankPost", {
	group = "Extras",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ timeout = 100 })
	end,
})

-- Return to last edit location
autocmd("BufReadPost", {
	group = "Extras",
	pattern = "*",
	callback = function()
		if fn.line("'\"") > 0 and fn.line("'\"") <= fn.line("$") then
			fn.setpos(".", fn.getpos("'\""))
			vim.cmd("normal! zz")
			vim.cmd("silent! foldopen")
		end
	end,
})

-- Trim leading whitespace on write
autocmd("BufWritePre", {
	group = "Extras",
	pattern = "*",
	callback = function()
		if not vim.o.binary and vim.o.filetype ~= "diff" then
			local current_view = fn.winsaveview()
			vim.cmd([[keeppatterns %s/\s\+$//e]])
			fn.winrestview(current_view)
		end
	end,
})
