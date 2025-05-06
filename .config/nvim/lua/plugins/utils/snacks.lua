return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		dashboard = { enabled = false },
		indent = { enabled = true },
		input = { enabled = true },
		notifier = {
			enabled = true,
			timeout = 3000,
		},
		picker = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		statuscolumn = { enabled = true },
		terminal = { enabled = true, win = { style = "terminal" } },
		toggle = { enabled = true },
		words = { enabled = true },
		styles = {
			notification = {
				-- wo = { wrap = true } -- Wrap notifications
			},
		},
	},
	keys = {
		-- Top Pickers
		{
			"<leader><space>",
			function() require("snacks").picker.smart() end,
			desc = "Smart Find Files",
		},
		{
			"<leader>:",
			function() require("snacks").picker.command_history() end,
			desc = "Command History",
		},
		{
			"<leader>n",
			function() require("snacks").picker.notifications() end,
			desc = "Notification History",
		},

		-- find
		{
			"<leader>fb",
			function() require("snacks").picker.buffers() end,
			desc = "Find Buffers",
		},
		{
			"<leader>fc",
			function() require("snacks").picker.files({ cwd = vim.fn.stdpath("config") }) end,
			desc = "Find Config File",
		},
		{
			"<leader>ff",
			function() require("snacks").picker.files() end,
			desc = "Find Files",
		},
		{
			"<leader>fg",
			function() require("snacks").picker.git_files() end,
			desc = "Find Git Files",
		},
		{
			"<leader>fp",
			function() require("snacks").picker.projects() end,
			desc = "Find Projects",
		},
		{
			"<leader>fr",
			function() require("snacks").picker.recent() end,
			desc = "Find Recent",
		},

		-- git
		{
			"<leader>gb",
			function() require("snacks").picker.git_branches() end,
			desc = "Git Branches",
		},
		{
			"<leader>gl",
			function() require("snacks").picker.git_log() end,
			desc = "Git Log",
		},
		{
			"<leader>gL",
			function() require("snacks").picker.git_log_line() end,
			desc = "Git Log Line",
		},
		{
			"<leader>gs",
			function() require("snacks").picker.git_status() end,
			desc = "Git Status",
		},
		{
			"<leader>gS",
			function() require("snacks").picker.git_stash() end,
			desc = "Git Stash",
		},
		{
			"<leader>gd",
			function() require("snacks").picker.git_diff() end,
			desc = "Git Diff (Hunks)",
		},
		{
			"<leader>gf",
			function() require("snacks").picker.git_log_file() end,
			desc = "Git Log File",
		},
		{
			"<leader>gB",
			function() require("snacks").gitbrowse() end,
			desc = "Git Browse",
			mode = { "n", "v" },
		},
		-- { "<leader>gg", function() require('snacks').lazygit() end, desc = "Lazygit" },

		-- Grep
		{ --fs
			"<leader>sg",
			function() require("snacks").picker.grep() end,
			desc = "Grep",
		},
		-- search
		{ --f:
			"<leader>s:",
			function() require("snacks").picker.commands() end,
			desc = "Command History",
		},
		{ --fd
			"<leader>sd",
			function() require("snacks").picker.diagnostics() end,
			desc = "Diagnostics",
		},
		{ --fD
			"<leader>sD",
			function() require("snacks").picker.diagnostics_buffer() end,
			desc = "Buffer Diagnostics",
		},
		{ --fi
			"<leader>si",
			function() require("snacks").picker.icons() end,
			desc = "Icons",
		},

		{ --fm
			"<leader>sm",
			function() require("snacks").picker.marks() end,
			desc = "Marks",
		},
		{ --fj
			"<leader>sj",
			function() require("snacks").picker.jumps() end,
			desc = "Jumps",
		},
		{ --fl
			"<leader>sl",
			function() require("snacks").picker.loclist() end,
			desc = "Location List",
		},
		{ --fq
			"<leader>sq",
			function() require("snacks").picker.qflist() end,
			desc = "Quickfix List",
		},
		-- { "<leader>sH", function() require('snacks').picker.highlights() end, desc = "Highlights" },

		{
			"<leader>f:",
			function() require("snacks").picker.commands() end,
			desc = "Commands",
		},
		{ --fk
			"<leader>sk",
			function() require("snacks").picker.keymaps() end,
			desc = "Keymaps",
		},
		{ --ft
			"<leader>uC",
			function() require("snacks").picker.colorschemes() end,
			desc = "Colorschemes",
		},
		{ --f"
			'<leader>s"',
			function() require("snacks").picker.registers() end,
			desc = "Registers",
		},
		-- { "<leader>sa", function() require('snacks').picker.autocmds() end, desc = "Autocmds" },

		{ --fh
			"<leader>sh",
			function() require("snacks").picker.help() end,
			desc = "Help Pages",
		},
		-- { "<leader>sM", function() require('snacks').picker.man() end, desc = "Man Pages" },
		-- { "<leader>sp", function() require('snacks').picker.lazy() end, desc = "Search for Plugin Spec" },
		{ --???
			"<leader>sR",
			function() require("snacks").picker.resume() end,
			desc = "Resume",
		},
		{ --fu
			"<leader>su",
			function() require("snacks").picker.undo() end,
			desc = "Undo History",
		},
		-- LSP
		{
			"gd",
			function() require("snacks").picker.lsp_definitions() end,
			desc = "Goto definitions",
		},
		{
			"gD",
			function() require("snacks").picker.lsp_definitions() end,
			desc = "Goto Declaration",
		},
		{
			"gr",
			function() require("snacks").picker.lsp_references() end,
			nowait = true,
			desc = "References",
		},
		{
			"gy",
			function() require("snacks").picker.lsp_type_definitions() end,
			desc = "Goto T[y]pe Definition",
		},
		{
			"<leader>.",
			function() require("snacks").scratch() end,
			desc = "Toggle Scratch Buffer",
		},
		{
			"<leader>S",
			function() require("snacks").scratch.select() end,
			desc = "Select Scratch Buffer",
		},

		{
			"<leader>bd",
			function() require("snacks").bufdelete() end,
			desc = "Delete Buffer",
		},
		{
			"<leader>cR",
			function() require("snacks").rename.rename_file() end,
			desc = "Rename File",
		},
		{
			"<leader>un",
			function() require("snacks").notifier.hide() end,
			desc = "Dismiss All Notifications",
		},

		{
			"<c-/>",
			function() require("snacks").terminal() end,
			desc = "Toggle Terminal",
		},
		{
			"<c-_>",
			function() require("snacks").terminal() end,
			desc = "which_key_ignore",
		},

		{
			"]]",
			function() require("snacks").words.jump(vim.v.count1) end,
			desc = "Next Reference",
			mode = { "n", "t" },
		},
		{
			"[[",
			function() require("snacks").words.jump(-vim.v.count1) end,
			desc = "Prev Reference",
			mode = { "n", "t" },
		},
	},
	-- init = function()
	--   vim.api.nvim_create_autocmd("User", {
	--     pattern = "VeryLazy",
	--     callback = function()
	--       -- Setup some globals for debugging (lazy-loaded)
	--       _G.dd = function(...)
	--         require('snacks').debug.inspect(...)
	--       end
	--       _G.bt = function()
	--         require('snacks').debug.backtrace()
	--       end
	--       vim.print = _G.dd -- Override print to use snacks for `:=` command
	--
	--       -- Create some toggle mappings
	--       require('snacks').toggle.option("spell", { name = "Spelling" }):map("<leader>us")
	--       require('snacks').toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
	--       require('snacks').toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
	--       require('snacks').toggle.diagnostics():map("<leader>ud")
	--       require('snacks').toggle.line_number():map("<leader>ul")
	--       require('snacks').toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
	--       require('snacks').toggle.treesitter():map("<leader>uT")
	--       require('snacks').toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
	--       require('snacks').toggle.inlay_hints():map("<leader>uh")
	--       require('snacks').toggle.indent():map("<leader>ug")
	--       require('snacks').toggle.dim():map("<leader>uD")
	--     end,
	--   })
	-- end,
}
