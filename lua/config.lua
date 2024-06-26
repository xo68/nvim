local opt = vim.opt

-- Turn on spell check
opt.spelllang = "en_us"
opt.spell = true

-- Core settings
opt.textwidth = 80
opt.laststatus = 3
opt.tabstop = 4
opt.softtabstop = 4
opt.smarttab = true
opt.shiftwidth = 4
opt.scrolloff = 8 -- Limit scrolling and always try keep 8 lines
opt.sidescrolloff = 8 -- Limit scrolling and always try keep 8 lines
opt.updatetime = 250
opt.mouse = "a"

-- Copy / Paste in OS clipboard
opt.clipboard = "unnamedplus"

-- Show indent - Why would we need a plugin for that ? :)
opt.list = true
opt.listchars:append("tab:┊ ")
opt.listchars:append("lead:.")
opt.listchars:append("leadmultispace:┊   ")
opt.listchars:append("trail:·,")

-- Enable bunch of good stuffs
opt.hlsearch = true -- highlights of search -> Can be disabled with a shortcut
opt.swapfile = true
opt.number = true
opt.relativenumber = true
opt.expandtab = true -- Use spaces and not tabs
opt.incsearch = true
opt.termguicolors = true
opt.cursorline = true -- highlight the current cursor line
opt.smartindent = true
opt.autoindent = true -- copy indent from current line when starting new one
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
opt.compatible = false
opt.showcmd = true
opt.wildmenu = true

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- Disable few stuffs
opt.title = false
opt.wrap = false

-- Highlight yank section
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Diagnostic rendering & options
vim.diagnostic.config({
	underline = false,
	-- virtual_text = false,
	virtual_text = {
		severity = { min = vim.diagnostic.severity.ERROR },
		source = true,
	},
	float = {
		source = "always",
		border = "single",
	},
})
