return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter", -- Only required in insert mode
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		"L3MON4D3/LuaSnip", -- snippet engine
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
		"onsails/lspkind.nvim",
		"hrsh7th/cmp-nvim-lsp-signature-help",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		-- load vs-code like snippets from plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})

		cmp.setup.filetype("gitcommit", {
			sources = cmp.config.sources({
				{ name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
			}, {
				{ name = "buffer" },
			}),
		})
		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			window = {
				completion = cmp.config.window.bordered({ border = "single" }),
				documentation = cmp.config.window.bordered({ border = "single" }),
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<Tab>"] = function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end,
				["<S-Tab>"] = function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end,

				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-u>"] = cmp.mapping.scroll_docs(-6),
				["<C-d>"] = cmp.mapping.scroll_docs(6),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),
			-- sources for autocompletion
			sources = cmp.config.sources({
				{ name = "nvim_lsp", priority = 8 }, -- lsp
				{ name = "nvim_lua", priority = 5 }, -- Nvim Lua
				-- { name = "treesitter", priority = 6 },
				{ name = "luasnip", priority = 5 }, -- snippets
				{ name = "buffer", priority = 9 }, -- text within current buffer
				{ name = "path", priority = 5 }, -- file system paths
				{ name = "nvim_lsp_signature_help", priority = 5 }, -- emphasized parameters wiht completion when starting a function
			}),

			-- Type of sorting of the completion
			sorting = {
				priority_weight = 1.0,
				comparators = {
					cmp.config.compare.score,
					cmp.config.compare.locality,
					cmp.config.compare.order,
					cmp.config.compare.sort_text,
					cmp.config.compare.exact,
					cmp.config.compare.kind,
					cmp.config.compare.offset,
					cmp.config.compare.length,
				},
			},

			-- configure lspkind for vs-code like icons
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol_text",
					maxwidth = 50,
					ellipsis_char = "...",
					menu = {
						nvim_lsp = "[LSP]",
						ultisnips = "[US]",
						luasnip = "[Snippet]",
						nvim_lua = "[Lua]",
						path = "[Path]",
						buffer = "[Buffer]",
					},
				}),
			},
		})
	end,
}
