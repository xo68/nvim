return {
	-- Super nice UI for the different text boxes
	"stevearc/dressing.nvim",
	opts = {},
	config = function()
		require("dressing").setup({
			input = { enabled = false },
		})
	end,
}
