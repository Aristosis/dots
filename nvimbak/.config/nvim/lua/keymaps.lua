--[[
    Pure Vim keymaps
]]

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set

keymap("n", "<Esc><Esc>", function()
	vim.cmd("noh")
	vim.snippet.stop()
end, { silent = true, desc = "Clear highlights" })
keymap("n", "<Esc>", vim.snippet.stop, { silent = true, desc = "Clear highlights" })

-- Summon floating diagnostic window
keymap("n", "<leader>d", vim.diagnostic.open_float, { silent = true, desc = "Open diagnostic in floating window" })

-- Navigation
keymap("n", "<C-d>", "<C-d>zz", { desc = "Half-page Down" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Half-page Up" })

keymap("n", "<C-h>", "<C-w>h", { desc = "Focus window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Focus window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Focus window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Focus window" })
