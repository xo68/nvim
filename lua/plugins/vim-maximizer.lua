return {
	-- Maximize the current screen when in split view
	"szw/vim-maximizer",

	config = function()
		vim.keymap.set("n", "<leader>m", ":MaximizerToggle <cr>", { desc = "VimMaximizer - [m]ax/[m]in splitview" })
	end,
}
