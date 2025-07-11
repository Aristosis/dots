local autocmd = vim.api.nvim_create_autocmd
vim.api.nvim_create_augroup("augroup", { clear = true })

-- Highlight yank
autocmd("TextYankPost", {
	group = "augroup",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ timeout = 100 })
	end,
})

-- Restore cursor position on file open
autocmd("BufReadPost", {
	pattern = "*",
	callback = function()
		local line = vim.fn.line("'\"")
		if line > 1 and line <= vim.fn.line("$") then
			vim.cmd("normal! g'\"")
		end
	end,
})

--[[
Disable relativenumber outside normal mode
]]
autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
	pattern = "*",
	group = "augroup",
	callback = function()
		if vim.o.nu and vim.api.nvim_get_mode().mode ~= "i" then
			vim.opt.relativenumber = true
		end
	end,
})

autocmd({ "BufLeave", "FocusLost", "InsertEnter", "CmdlineEnter", "WinLeave" }, {
	pattern = "*",
	group = "augroup",
	callback = function()
		if vim.o.nu then
			vim.opt.relativenumber = false
			if not vim.tbl_contains({ "@", "-" }, vim.v.event.cmdtype) then
				vim.cmd("redraw")
			end
		end
	end,
})
--
