local fzf = require("fzf-lua")
vim.keymap.set("n", "<leader>ff", fzf.files, { noremap = true, silent = true })
vim.keymap.set("n", "<C-/>", fzf.lgrep_curbuf, { noremap = true, silent = true })
vim.keymap.set("n", "<C-S-/>", fzf.live_grep, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fgb", fzf.git_branches, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fgs", fzf.git_status, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fgd", fzf.git_diff, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>fd", fzf.diagnostics_document, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fD", fzf.diagnostics_workspace, { noremap = true, silent = true })

local oil = require("oil")
vim.keymap.set("n", "-", oil.open)
