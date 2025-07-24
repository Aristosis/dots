vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local o = vim.opt

-- General
o.spelllang = { "en" }
o.mouse = "a" -- Enable mouse
o.confirm = true -- Ask before closing unsaved buffers
o.splitbelow = true -- New splits open below
o.splitkeep = "screen"
o.splitright = true -- New splits open to the right
o.ignorecase = true -- Case-insensitive search
o.smartcase = true -- But case-sensitive if uppercase is used
o.scrolloff = 6 -- Keep cursor 4 lines from screen edges
o.sidescrolloff = 8 -- Same for horizontal scrolling
o.wrap = false -- Disable line wrapping
o.undofile = true -- Persistent undo history
o.undolevels = 10000
o.updatetime = 200 -- Save swap file and trigger CursorHold
o.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
o.updatetime = 250 -- Update time relied upon by key sequences n stuff
o.timeoutlen = 300 -- Take this long te leave me the fuck alone
o.backspace = "indent,eol,start" -- Make backspace work properly over everything
o.swapfile = false -- Disable annoying swapfile errors
o.grepprg = "rg --vimgrep" -- Use ripgrep for grepping
o.grepformat = "%f:%l:%c:%m" -- default idk why its here
o.completeopt = "menu,menuone,fuzzy,noselect"
o.conceallevel = 2
o.wildmode = "longest:full,full" -- Command-line completion mode
o.winminwidth = 5 -- Minimum window width
o.foldlevel = 99
o.confirm = true
o.inccommand = "nosplit" -- show changes live in substitute
o.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
vim.g.markdown_recommended_style = 0

-- UI
o.number = true
o.relativenumber = true
o.numberwidth = 2
o.cursorline = true
o.laststatus = 1 -- No statusline on lone window
o.showmode = true -- Display current mode (redundant if using a statusline)
o.pumblend = 30 -- Transparency for popup menu
o.pumheight = 10 -- Limit completion menu height
o.signcolumn = "yes" -- Minimum thickness for the sign column (comes before numberline, with Git stuff)
o.linebreak = true -- Wrap lines at convenient points
o.termguicolors = true -- Enable true color support
o.shortmess:append({ W = true, I = true, c = true }) -- Remove intro screen (fuck the ugandan kids), failedmatches, and write messages
o.list = true -- Show some invisible characters (tabs...
o.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}
o.laststatus = 3 -- global statusline

-- Folding and Indentation
o.expandtab = false -- Convert tabs to spaces, should be set for each filetype
o.shiftwidth = 4 -- Indent by 4 spaces if expandtab, else treat 4 spaces as a single tab (like when backspacing)
o.tabstop = 4 -- Tabs appear 4 spaces wide
o.smartindent = true -- Auto-indent new lines
o.formatoptions = "jcroqlnt" -- See fo-table lol, also ctrl u to delete accidental comments
o.foldmethod = "manual" -- What is used to decide fold behaviour
