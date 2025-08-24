vim.lsp.enable({
	"clangd",
	"lua_ls",
	"pyright",
	"rust_analyzer",
	"tsserver",
	"zls",
})
vim.diagnostic.config({ virtual_text = true })

vim.opt.title = true
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4

vim.opt.confirm = true
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.grepprg = "rg --vimgrep"

vim.opt.scrolloff = 6
vim.opt.sidescrolloff = 8

vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
vim.opt.undolevels = 10000
vim.opt.virtualedit = "block"
vim.opt.completeopt = "menu,menuone,popup,noinsert,fuzzy"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.list = true
vim.opt.listchars = "tab:▏ ,trail:-,leadmultispace:▏   ,nbsp:+"
vim.opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}
vim.opt.wrap = false
vim.opt.conceallevel = 2
vim.opt.foldlevel = 99
vim.opt.inccommand = "nosplit"
vim.opt.cursorline = true
vim.opt.showmode = true
vim.opt.pumblend = 5
vim.opt.pumheight = 10
vim.opt.signcolumn = "yes"
vim.opt.shortmess:append({ W = true, I = true, c = true })
vim.opt.laststatus = 3
vim.opt.smartindent = true
vim.opt.formatoptions = "jcroqlnt"
vim.opt.foldmethod = "manual"

vim.opt.expandtab = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.g.netrw_banner = false
vim.g.netrw_browse_split = 0
vim.g.netrw_altv = true
vim.g.netrw_liststyle = 3
