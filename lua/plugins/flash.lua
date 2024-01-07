return {
	"folke/flash.nvim",
	opts = {
		-- To be enabled if colorschemee is not showing great
		label = {
			rainbow = {
				enabled = false,
				shade = 7, -- number between 1 and 9
			},
		},
	},
	keys = {
		{
			"s",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash - [s]earch (flash)",
		},
		{
			"S",
			mode = { "n", "x", "o" },
			function()
				require("flash").treesitter()
			end,
			desc = "Flash - [s]earch (treesitter)",
		},
		{
			"R",
			mode = { "o", "x" },
			function()
				require("flash").treesitter_search()
			end,
			desc = "Flash - [R] Treesitter (e.g.with copy or yank)",
		},
	},
}
