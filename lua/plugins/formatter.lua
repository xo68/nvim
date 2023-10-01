return {
	"stevearc/conform.nvim",
	opts = {},

	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				go = { "gofmt", "golines" },
				c = { "clang_format" },

				-- Conform will run multiple formatters sequentially
				-- python = { "isort", "black" },
				-- Use a sub-list to run only the first available formatter
				-- javascript = { { "prettierd", "prettier" } },
			},
			format_on_save = {
				lsp_fallack = true,
				async = false,
				timeout_ms = 500,
			},
		})
	end,
}
