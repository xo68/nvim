return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			c = { "cpplint" },
			go = { "golangcilint" },
			-- python is already handled by pyls in lsp config
			-- python = { "mypy", "flake8" },
			-- python = { "pylint" },
			-- lua = { "luacheck" },
		}

		-- Call linter when saving the file, opening a new buffer or leaving Insert
		vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
			callback = function()
				lint.try_lint()
			end,
		})
		vim.keymap.set(
			"n",
			"<leader>ll",
			':lua require("lint").try_lint()<cr><C-l>',
			{ desc = "Language - [l]anguage [l]inter (nvim-lint)" }
		)
	end,
}
