local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({ import = "plugins" })
vim.cmd.colorscheme("kanagawa")
-- vim.cmd.colorscheme("rose-pine")
-- vim.cmd.colorscheme("gruvbox")
vim.opt.laststatus = 3
vim.cmd([[highlight winseparator guibg=none]])
vim.cmd([[highlight winseparator guifg=white]])

-- Some colors
-- local lgrey = "#303030"
-- local bg = "#202020"
-- local dgrey = "#101010"
-- vim.api.nvim_set_hl(0, "Search", { bg = "red", fg = "blue" })
-- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", fg = "#5E81AC" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = lgrey })
-- vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = lgrey })
-- vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = lgrey })
-- vim.api.nvim_set_hl(0, "MasonNormal", { bg = lgrey })
-- vim.api.nvim_set_hl(0, "LazyNormal", { bg = lgrey })
-- vim.api.nvim_set_hl(0, "PMenu", { bg = lgrey })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = lgrey })
-- vim.api.nvim_set_hl(0, "WildMenu", { bg = lgrey })
