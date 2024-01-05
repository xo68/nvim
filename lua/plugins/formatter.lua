return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {},

	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				go = { "gofmt", "golines" },
				c = { "clang_format" },
				markdown = { "prettier" },
				-- Conform will run multiple formatters sequentially
				-- python = { "isort", "black" },
				-- Use a sub-list to run only the first available formatter
				-- javascript = { { "prettierd", "prettier" } },
			},
			format_on_save = {
				lsp_fallack = true,
				timeout_ms = 500,
			},
			vim.keymap.set(
				{ "n", "v" },
				"<leader>lf",
				':lua require("conform").format({ lsp_fallback = false, async = true, timeout_ms = 500, })<cr><C-l>',
				{ desc = "Language - [l]anguage [f]ormatter (Conform)" }
			),
		})
	end,
}
