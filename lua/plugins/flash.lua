return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {},

        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "flash - [s]earch (flash)" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "flash - [s]earch treesitter" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Flash - [R] Treesitter (e.g.with copy or yank)" },
        },
}
