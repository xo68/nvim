return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			python = { "pylint" },
			c = { "cpplint" },
			go = { "golangcilint" },
			lua = { "luacheck" },
		}

		-- Call linter when saving the file, opening a new buffer or leaving Insert
		vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
