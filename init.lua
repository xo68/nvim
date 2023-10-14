require("remap")
require("config")
require("lazy-plugin")
-- vim.cmd([[colorscheme kanagawa-dragon]])
-- vim.cmd([[colorscheme tokyonight-night]])
-- vim.cmd([[colorscheme tokyonight]])
-- vim.cmd([[colorscheme nightfox]])
-- vim.cmd([[colorscheme catppuccin]])
-- vim.cmd([[colorscheme rose-pine]])
-- vim.cmd([[colorscheme monokai_pro]])
vim.cmd([[colorscheme carbonfox]])

-- Apply some nice UI configs after colorscheme is set
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- Split screen seperator
vim.opt.laststatus = 3
vim.cmd([[highlight WinSeparator guibg=none]])
vim.cmd([[highlight WinSeparator guifg=white]])

-- Top bar / Winbar
vim.opt.winbar = "%=%m %f Buf:[%n]"
vim.cmd([[highlight WinBar guifg=white guibg=none]])
