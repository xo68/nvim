return {
    "bluz71/vim-nightfly-guicolors",
    "morhetz/gruvbox",
    "rose-pine/neovim",
    "catppuccin/nvim",
    "folke/tokyonight.nvim",
    "rebelot/kanagawa.nvim",
    "joshdick/onedark.vim",
    "romainl/Apprentice",
    "shaunsingh/solarized.nvim",
    "AlexvZyl/nordic.nvim",
    "tanvirtin/monokai.nvim",
    "Mofiqul/dracula.nvim",
    "EdenEast/nightfox.nvim",
    "savq/melange-nvim",
    "sainnhe/sonokai",
    "neanias/everforest-nvim",
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            -- vim.cmd([[colorscheme nightfly]])
            -- vim.cmd([[colorscheme gruvbox]])
        end,
}
