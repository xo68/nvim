require("keymap")
require("config")
require("lazyvim")

vim.cmd.colorscheme("catppuccin")
-- vim.cmd.colorscheme("rose-pine")
-- vim.cmd.colorscheme("tokyonight-moon")
-- vim.cmd.colorscheme("monokai_pro")

-- Apply some nice UI configs after colorscheme is set
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- Split screen seperator
vim.opt.laststatus = 3
vim.cmd([[highlight WinSeparator guibg=none]])
vim.cmd([[highlight WinSeparator guifg=white]])

-- Top bar / Winbar - HANDLED IN lualine.lua
-- vim.opt.winbar = "%=%m [Path:%F] - Buff [%n]"
-- vim.cmd([[highlight WinBar guifg=white guibg=none]])
