local grapple = require("grapple")

local function cycle_tag_prev()
	grapple.cycle_tags("prev")
end

local function cycle_tag_next()
	grapple.cycle_tags("next")
end

local function cycle_scope_prev()
	grapple.cycle_scopes("prev")
end

local function cycle_scope_next()
	grapple.cycle_scopes("next")
end

vim.keymap.set("n", "<leader>m", grapple.toggle)
vim.keymap.set("n", "<leader>q", grapple.toggle_scopes)
vim.keymap.set("n", "<leader><leader>", grapple.toggle_tags)

vim.keymap.set("n", "<leader>n", cycle_tag_next)
vim.keymap.set("n", "<leader>p", cycle_tag_prev)
vim.keymap.set("n", "<leader>N", cycle_scope_next)
vim.keymap.set("n", "<leader>P", cycle_scope_prev)

return {
	scope = "git_branch",
}
