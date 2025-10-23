local grapple = require("grapple")


local function cycle_prev()
	grapple.cycle_tags("prev")
end

local function cycle_next()
	grapple.cycle_tags("next")
end

vim.keymap.set("n", "<leader>m", grapple.toggle)
vim.keymap.set("n", "<leader>M", grapple.toggle_tags)
vim.keymap.set("n", "<leader>n", cycle_next)
vim.keymap.set("n", "<leader>p", cycle_prev)

return {
	scope = "git_branch",
}
