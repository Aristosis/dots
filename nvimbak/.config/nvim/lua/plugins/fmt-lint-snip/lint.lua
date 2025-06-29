return {
	"mfussenegger/nvim-lint",
	config = function()
		require("lint").linters_by_ft = {
			lua = { "selene" },
			luau = { "selene" },
		}

		vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI", "BufWritePost", "BufReadPost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
