return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },

		dependencies = {
			"hrsh7th/nvim-cmp", -- Core engine
			"hrsh7th/cmp-nvim-lsp", -- Add Capabilities
			"hrsh7th/cmp-buffer", -- Buffer text completion
			"hrsh7th/cmp-path", -- Path completion
			"hrsh7th/cmp-cmdline", -- CMD Line
			"hrsh7th/cmp-vsnip", -- For VSNIP
			"hrsh7th/vim-vsnip", -- For VSNIP
			"folke/neodev.nvim", -- For Lua dev
		},

		config = function()
			local lspconfig = require("lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local neodev = require("neodev")
			local opts = { noremap = true, silent = true }
			local keymap = vim.keymap
			local util = require("lspconfig/util")
			local handlers = {
				["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" }),
				["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" }),
			}

			neodev.setup({})

			local on_attach = function(client, bufnr)
				opts.buffer = bufnr

				-- set keybinds
				opts.desc = "LSP - [g]o [r]eferences (Telescope)"
				keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

				opts.desc = "LSP - [g]o to [D]eclaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

				opts.desc = "LSP - [g]o [d]efinitions (Show definitions)"
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

				opts.desc = "LSP - [g]o [i]mplementations (Show implementations)"
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

				opts.desc = "LSP - [g]o T[y]pe definitions"
				keymap.set("n", "gy", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

				opts.desc = "LSP - [c]ode [a]ctions"
				keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

				opts.desc = "LSP - [s]mart [r]ename"
				keymap.set("n", "<leader>sr", vim.lsp.buf.rename, opts) -- smart rename

				opts.desc = "LSP - [d]iagnostic (Show line diagnostics)"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

				opts.desc = "LSP - [D]iagnostics (Show buffer diagnostics)"
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

				opts.desc = "LSP - Go to previous [d]iagnostic"
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

				opts.desc = "LSP - Go to next [d]iagnostic"
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

				opts.desc = "LSP - [K] Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

				-- opts.desc = "LSP - [k] Show signature"
				-- keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

				opts.desc = "LSP - [l]sp [r]estart"
				keymap.set("n", "<leader>lr", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
			end

			-- used to enable autocompletion (assign to every lsp server config)
			local capabilities = cmp_nvim_lsp.default_capabilities()

			-- Change the Diagnostic symbols in the sign column (gutter)
			local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			-- configure markdown server
			lspconfig["marksman"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			-- configure python server
			-- lspconfig["jedi_language_server"].setup({
			-- lspconfig["pyright"].setup({
			lspconfig["pylsp"].setup({
				handlers = handlers,
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					pylsp = {
						configurationSources = { "flake8" },
						plugins = {
							flake8 = {
								enabled = true,
								ignore = { "E501", "E741", "503" },
								maxLineLength = 120,
							},
							jedi_completion = { enabled = true },
							jedi_definition = { enabled = true },
							jedi_hover = { enabled = true },
							jedi_references = { enabled = true },
							jedi_signature_help = { enabled = true },
							jedi_symbols = { enabled = true, all_scopes = true },
							mypy = { enabled = true },
							pycodestyle = { enabled = true },
							pyflakes = { enabled = true },
							pylint = { enabled = true },
						},
					},
				},
			})

			-- configure clangd server
			lspconfig["clangd"].setup({
				handlers = handlers,
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					clangd = {
						init_options = {
							usePlaceholders = true,
							completeUnimported = true,
							clangdFileStatus = true,
						},
					},
				},
			})

			-- configure go server
			lspconfig["gopls"].setup({
				handlers = handlers,
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				root_dir = util.root_pattern("go.mod", ".git"),
				settings = {
					gopls = {
						gofumpt = true,
						staticcheck = true,
						usePlaceholders = true,
						completeUnimported = true, -- Auto import packages
						analyses = {
							nilness = true,
							unusedparams = true,
							unusedwrite = true,
							useany = true,
						},
					},
				},
			})

			-- configure lua server (with special settings)
			lspconfig["lua_ls"].setup({
				handlers = handlers,
				on_attach = on_attach,
				capabilities = capabilities,
				autostart = true,
				settings = { -- custom settings for lua
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
						-- make the language server recognize "vim" global
						diagnostics = {
							globals = {
								"vim",
								"require",
							},
						},
						workspace = {
							-- make language server aware of runtime files
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
						telemetry = {
							enable = false,
						},
						completion = {
							CallSnippet = "Replace", -- Option for Neodev
						},
					},
				},
			})
		end,
	},
}
