local key = vim.keymap.set
local keyt = { noremap = true, silent = true }

return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		config = function()
			local fzf = require("fzf-lua")

			key("n", "<leader>ff", fzf.files, keyt)
			key("n", "<leader>fr", fzf.oldfiles, keyt)
			key("n", "<leader>f\\", fzf.builtin, keyt)
			key("n", "<C-/>", fzf.lgrep_curbuf, keyt)
			key("n", "<C-S-/>", fzf.live_grep, keyt)

			key("n", "<leader>fgb", fzf.git_branches, keyt)
			key("n", "<leader>fgs", fzf.git_status, keyt)
			key("n", "<leader>fgd", fzf.git_diff, keyt)

			key("n", "<leader>fe", fzf.lsp_finder, keyt)
			key("n", "<leader>fd", fzf.diagnostics_document, keyt)
			key("n", "<leader>fD", fzf.diagnostics_workspace, keyt)

			key("n", '<leader>f"', fzf.registers, keyt)
		end,
		opts = {
			winopts = {
				border = "bold",
				preview = {
					border = "bold",
				},
				-- - "bold": Bold line box.
				-- - "double": Double-line box.
				-- - "none": No border.
				-- - "rounded": Like "single", but with rounded corners ("╭" etc.).
				-- - "shadow": Drop shadow effect, by blending with the background.
				-- - "single": Single-line box.
				-- - "solid": Adds padding by a single whitespace cell.
			},
		},
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "VeryLazy",
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup()

			vim.keymap.set("n", "<leader>h", function()
				harpoon:list():add()
			end)
			vim.keymap.set("n", "<leader><leader>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)

			vim.keymap.set("n", "<leader>1", function()
				harpoon:list():select(1)
			end)
			vim.keymap.set("n", "<leader>2", function()
				harpoon:list():select(2)
			end)
			vim.keymap.set("n", "<leader>3", function()
				harpoon:list():select(3)
			end)
			vim.keymap.set("n", "<leader>4", function()
				harpoon:list():select(4)
			end)
			vim.keymap.set("n", "<leader>5", function()
				harpoon:list():select(5)
			end)
			vim.keymap.set("n", "<leader>6", function()
				harpoon:list():select(6)
			end)
			vim.keymap.set("n", "<leader>7", function()
				harpoon:list():select(7)
			end)
			vim.keymap.set("n", "<leader>8", function()
				harpoon:list():select(8)
			end)
			vim.keymap.set("n", "<leader>9", function()
				harpoon:list():select(9)
			end)
		end,
	},
	{
		"NeogitOrg/neogit",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"ibhagwan/fzf-lua",
		},
	},
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		config = function()
			key("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
			require("oil").setup({})
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		opts = true,
	},
}
