--[[
    This file contains *pure vim opts* that I consider essential
    First config that is loaded, even before lazy is setup.
    This is so that if any plugins were to fail,
    I can still navigate without being subject to hell.
    ... also wrapped in pcalls cause I am paranoid
]]

local o = vim.opt
local function ApplyOpts(opts)
	for i, v in pairs(opts) do
		local success, er = pcall(function()
			o[i] = v
		end)
		if not success then
			vim.notify(string.format("Failed to set up opt: %s -> %s, %s", i, v, er))
		end
	end
	-- vim.notify("Finished loading Opts")
end

-- OTHER
o.shortmess:append({ W = true, I = true, c = true }) -- Less annoying messages
vim.diagnostic.config({ virtual_text = true })

-- Diagnostic Signs
local symbols = { Error = "󰅙 ", Info = "󰋼 ", Hint = "󰌵 ", Warn = " " }

vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
	},
	severity_sort = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = symbols.Error,
			[vim.diagnostic.severity.WARN] = symbols.Warn,
			[vim.diagnostic.severity.INFO] = symbols.Info,
			[vim.diagnostic.severity.HINT] = symbols.Hint,
		},
	},
})

local opts = {
	-- Input/Interaction
	mouse = "a", -- Enable mouse in all modes
	backspace = "indent,eol,start", -- Make backspace work properly over everything
	confirm = true, -- Ask before closing unsaved buffers

	-- Display/UI
	number = true, -- Show line numbers
	numberwidth = 2, -- Good width for the numberline on the left, also see signcolumn
	relativenumber = true, -- Relative line numbers for easier navigation
	cursorline = true, -- Highlight current line
	list = true, -- Show invisible characters (like tabs)
	conceallevel = 0, -- Don't hide markup (like in Markdown)
	laststatus = 3, -- Global statusline (cleaner look)
	showmode = true, -- Display current mode (redundant if using a statusline)
	pumblend = 30, -- Transparency for popup menu
	pumheight = 10, -- Limit completion menu height
	signcolumn = "yes:1", -- Minimum thickness for the sign column (comes before numberline, with Git stuff)
	splitbelow = true, -- New splits open below
	splitright = true, -- New splits open to the right
	termguicolors = true, -- Enable true color support

	-- Editing
	expandtab = true, -- Convert tabs to spaces
	shiftwidth = 4, -- Indent by 4 spaces
	tabstop = 4, -- Tabs are 4 spaces wide
	smartindent = true, -- Auto-indent new lines
	formatoptions = "jcroqlnt", -- Better text formatting
	foldlevel = 99, -- Start with all folds open
	foldmethod = "indent", -- Fold based on indentation (UFO overrides this)

	-- Search/Navigation
	ignorecase = true, -- Case-insensitive search
	smartcase = true, -- But case-sensitive if uppercase is used
	wildmode = "longest:full,full", -- Better command-line completion
	scrolloff = 4, -- Keep cursor 4 lines from screen edges
	sidescrolloff = 8, -- Same for horizontal scrolling
	wrap = false, -- Disable line wrapping

	-- Performance/Responsiveness
	-- timeoutlen = 500, -- Shorter key timeout for better responsiveness
	updatetime = 200, -- Faster updates (affects CursorHold, etc.)
	-- lazyredraw = true, -- Prevent redraws during macros and registers
	-- autoread = true, -- Auto-reload files when changed externally

	-- File Management
	undofile = true, -- Persistent undo history
	-- swapfile        = false,                  -- Disable annoying swapfile warnings
}

ApplyOpts(opts)
