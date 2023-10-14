local opt = vim.opt

-- Some settings
-- opt.guicursor = "" -- Fat cursor
-- opt.colorcolumn = "80"
opt.laststatus = 3
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.scrolloff = 8 -- Limit scrolling and always try keep 8 lines
opt.sidescrolloff = 8 -- Limit scrolling and always try keep 8 lines
opt.updatetime = 50
opt.mouse = "a"
opt.showtabline = 2

-- Enable few stuffs
opt.title = false
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
opt.wrap = false
opt.hlsearch = false --No highlights of search
