return {
	{
		"mzlogin/vim-markdown-toc", -- Markdown table of content
		config = function()
			vim.g.vmt_list_indent_text = "  " -- 2 spaces indent
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		config = function()
			-- vim.fn["mkdp#util#install"]()
			vim.g.mkdp_browser = "Google Chrome.app"
			vim.keymap.set(
				"n",
				"<leader>Ms",
				"<cmd> MarkdownPreview<CR>",
				{ desc = "Markdown: [M]arkdowm preview [s]tart (buffer)" }
			)
			vim.keymap.set(
				"n",
				"<leader>MS",
				"<cmd> MarkdownPreviewStop<CR>",
				{ desc = "Markdown: [M]arkdowm preview [S]top (buffer)" }
			)
		end,
	},
}
