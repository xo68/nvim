return {
	"github/copilot.vim",
	config = function()
		vim.keymap.set("i", "<C-c>", 'copilot#Accept("\\<CR>")', {
			expr = true,
			replace_keycodes = false,
			desc = "Copilot - Accept suggestion",
		})
		vim.g.copilot_no_tab_map = true
		vim.keymap.set("i", "<C-v>", "<Plug>(copilot-next)", { desc = "Copilot - Next suggestion" })
		vim.keymap.set("i", "<C-x>", "<Plug>(copilot-previous)", { desc = "Copilot - Previous suggestion" })
	end,
}
