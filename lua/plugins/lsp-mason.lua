return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")
			local mason_tool_installer = require("mason-tool-installer")

			-- enable mason and configure icons
			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			-- list of servers for mason to install
			mason_lspconfig.setup({
				ensure_installed = {
					"lua_ls", -- lua
					"pyright", -- python
					"pyre", -- python
					"pylsp", -- python
					"jedi_language_server", -- python
					"clangd", -- C, C++, etc.
					"gopls", -- Go
					"marksman", -- Markdown
				},
				-- auto-install configured servers (with lspconfig)
				-- automatic_installation = true, -- not the same as ensure_installed
			})
			mason_tool_installer.setup({
				ensure_installed = {
					"debugpy", -- DAP python
					"pylint", -- lint python
					"mypy", -- lint python
					"cpplint", -- lint c / c++
					"golangci-lint", -- lint go
					"luacheck", -- lint lua
					"golines", -- format go
					"gofumpt", -- format go
					"stylua", -- format lua
					"isort", -- format python
					"markdownlint", -- markdown
					"prettier", -- markdown
					"black", -- format python
					"clang-format", -- format python
				},
				auto_update = false,
				run_on_start = true,
			})
		end,
	},
}
