vim.g.mapleader = " "
vim.g.maplocalleader = " "

local o = vim.opt

-- General
o.mouse = "a"                    -- Enable mouse
o.confirm = true                 -- Ask before closing unsaved buffers
o.splitbelow = true              -- New splits open below
o.splitright = true              -- New splits open to the right
o.ignorecase = true              -- Case-insensitive search
o.smartcase = true               -- But case-sensitive if uppercase is used
o.scrolloff = 4                  -- Keep cursor 4 lines from screen edges
o.sidescrolloff = 8              -- Same for horizontal scrolling
o.wrap = false                   -- Disable line wrapping
o.undofile = true                -- Persistent undo history
o.updatetime = 250               -- Update time relied upon by key sequences n stuff
o.timeoutlen = 300               -- Take this long te leave me the fuck alone
o.backspace = "indent,eol,start" -- Make backspace work properly over everything

-- UI
o.number = true
o.relativenumber = true
o.numberwidth = 2
o.cursorline = true
o.laststatus = 1       -- No statusline on lone window
o.showmode = true      -- Display current mode (redundant if using a statusline)
o.pumblend = 30        -- Transparency for popup menu
o.pumheight = 10       -- Limit completion menu height
o.signcolumn = "yes:1" -- Minimum thickness for the sign column (comes before numberline, with Git stuff)
o.termguicolors = true -- Enable true color support
o.shortmess:append({ W = true, I = true, c = true }) -- Remove intro screen (fuck the ugandan kids), failedmatches, and write messages

-- Folding and Indentation
o.expandtab = false         -- Convert tabs to spaces, should be set for each filetype
o.shiftwidth = 4            -- Indent by 4 spaces if expandtab, else treat 4 spaces as a single tab (like when backspacing)
o.tabstop = 4               -- Tabs appear 4 spaces wide
o.smartindent = true        -- Auto-indent new lines
o.formatoptions = "jcrqlnt" -- See fo-table lol, also ctrl u to delete accidental comments from o (nvm removed o from this)
o.foldmethod = "manual"     -- What is used to decide fold behaviour
