return {

	{
		"sainnhe/gruvbox-material",
	},
	{
		"ellisonleao/gruvbox.nvim",
		config = function()
			require("gruvbox").setup({
				terminal_colors = true, -- add neovim terminal colors
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = true,
					emphasis = true,
					comments = true,
					operators = false,
					folds = true,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = "hard", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {},
				dim_inactive = false,
				transparent_mode = false,
			})
		end,
	},
	{
		"navarasu/onedark.nvim",
		config = function()
			require("onedark").setup({
				-- Main options --
				style = "darker", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
				transparent = false, -- Show/hide background
				term_colors = true, -- Change terminal color as per the selected theme style
				ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
				cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

				-- toggle theme style ---
				toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
				toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

				-- Change code style ---
				-- Options are italic, bold, underline, none
				-- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
				code_style = {
					comments = "italic",
					keywords = "none",
					functions = "none",
					strings = "none",
					variables = "none",
				},

				-- Lualine options --
				lualine = {
					transparent = false, -- lualine center bar transparency
				},

				-- Custom Highlights --
				colors = {}, -- Override default colors
				highlights = {}, -- Override highlight groups

				-- Plugins Config --
				diagnostics = {
					darker = true, -- darker colors for diagnostic
					undercurl = true, -- use undercurl instead of underline for diagnostics
					background = true, -- use background color for virtual text
				},
			})
			-- require("onedark").load()
		end,
	},

	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				compile = false, -- enable compiling the colorscheme
				undercurl = true, -- enable undercurls
				commentStyle = { italic = true },
				functionStyle = { bold = false, italic = false },
				keywordStyle = { bold = false, italic = false },
				statementStyle = { bold = false, italic = false },
				typeStyle = {},
				transparent = true, -- do not set background color
				dimInactive = false, -- dim inactive window `:h hl-NormalNC`
				terminalColors = true, -- define vim.g.terminal_color_{0,17}
				colors = { -- add/modify theme and palette colors
					palette = {},
					theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
					-- Remove bg color of lineNr
					theme = {
						all = {
							ui = {
								bg_gutter = "none",
							},
						},
					},
				},
				overrides = function(colors) -- add/modify highlights
					local theme = colors.theme
					return {
						NormalFloat = { bg = "none" },
						FloatBorder = { bg = "none" },
						FloatTitle = { bg = "none" },

						-- Save an hlgroup with dark background and dimmed foreground
						-- so that you can use it where your still want darker windows.
						-- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
						NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
						-- Popular plugins that open floats will link to NormalFloat by default;
						-- set their background accordingly if you wish to keep them dark and borderless
						LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
						MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
						Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
						PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
						PmenuSbar = { bg = theme.ui.bg_m1 },
						PmenuThumb = { bg = theme.ui.bg_p2 },
						TelescopeTitle = { fg = theme.ui.special, bold = true },
						TelescopePromptNormal = { bg = theme.ui.bg_p1 },
						TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
						TelescopePreviewNormal = { bg = theme.ui.bg_dim },
						-- TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
						-- TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
						-- TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
					}
					-- return {}
				end,
				theme = "wave", -- Load "wave" theme when 'background' option is not set
				background = { -- map the value of 'background' option to a theme
					dark = "wave", -- try "dragon" !
					light = "lotus",
				},
			})
		end,
	},
	{
		"rose-pine/neovim",
		config = function()
			require("rose-pine").setup({
				--- @usage 'auto'|'main'|'moon'|'dawn'
				variant = "moon",
				--- @usage 'main'|'moon'|'dawn'
				dark_variant = "moon",
				bold_vert_split = true,
				dim_nc_background = false,
				disable_background = false,
				disable_float_background = false,
				disable_italics = true,
			})
			-- set colorscheme after options
			-- vim.cmd("colorscheme rose-pine-moon")
			vim.opt.laststatus = 3
			vim.cmd([[highlight winseparator guibg=none]])
			vim.cmd([[highlight winseparator guifg=white]])
			local lgrey = "#434343"
			vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#3B4252", fg = "#5E81AC" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = lgrey })
			vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = lgrey })
			vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = lgrey })
			vim.api.nvim_set_hl(0, "PMenu", { bg = lgrey })
		end,
	},
	{
		-- "tanvirtin/monokai.nvim",
		"loctvl842/monokai-pro.nvim",
		config = function()
			require("monokai-pro").setup({
				transparent_background = false,
				terminal_colors = true,
				devicons = true, -- highlight the icons of `nvim-web-devicons`
				styles = {
					comment = { italic = true },
					keyword = { italic = false }, -- any other keyword
					type = { italic = false }, -- (preferred) int, long, char, etc
					storageclass = { italic = false }, -- static, register, volatile, etc
					structure = { italic = false }, -- struct, union, enum, etc
					parameter = { italic = false }, -- parameter pass in function
					annotation = { italic = true },
					tag_attribute = { italic = false }, -- attribute of tag in reactjs
				},
				filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
				-- Enable this will disable filter option
				day_night = {
					enable = false, -- turn off by default
					day_filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
					night_filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
				},
				inc_search = "background", -- underline | background
				background_clear = {
					"float_win",
					-- "toggleterm",
					"telescope",
					-- "which-key",
					-- "renamer",
					-- "notify",
					"nvim-tree",
					-- "neo-tree",
					-- "bufferline", -- better used if background of `neo-tree` or `nvim-tree` is cleared
				}, -- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree", "nvim-tree", "bufferline"
				plugins = {
					bufferline = {
						underline_selected = false,
						underline_visible = false,
					},
					indent_blankline = {
						context_highlight = "default", -- default | pro
						context_start_underline = false,
					},
				},
				---@param c Colorscheme
				override = function(c) end,
			})
			-- vim.cmd("colorscheme monokai-pro")
		end,
	},

	{
		"edeneast/nightfox.nvim",
		config = function()
			require("nightfox").setup({
				options = {
					-- Compiled file's destination location
					compile_path = vim.fn.stdpath("cache") .. "/nightfox",
					compile_file_suffix = "_compiled", -- Compiled file suffix
					transparent = false,
					terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
					dim_inactive = false, -- Non focused panes set to alternative background
					module_default = true, -- Default enable value for modules
					colorblind = {
						enable = false, -- Enable colorblind support
						simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
						severity = {
							protan = 0, -- Severity [0,1] for protan (red)
							deutan = 0, -- Severity [0,1] for deutan (green)
							tritan = 0, -- Severity [0,1] for tritan (blue)
						},
					},
					styles = { -- Style to be applied to different syntax groups
						comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
						conditionals = "NONE",
						constants = "NONE",
						functions = "NONE",
						keywords = "bold",
						numbers = "NONE",
						operators = "NONE",
						strings = "NONE",
						types = "NONE",
						variables = "NONE",
					},
					inverse = { -- Inverse highlight for different types
						match_paren = false,
						visual = false,
						search = false,
					},
					modules = { -- List of various plugins and additional options
						-- ...
					},
				},
				palettes = {},
				specs = {},
				groups = {},
			})

			-- vim.cmd.colorscheme("nordfox")
			-- vim.cmd.colorscheme("carbonfox")
			-- vim.cmd.colorscheme("nightfox")
			vim.opt.laststatus = 3
			vim.cmd([[highlight winseparator guibg=none]])
			vim.cmd([[highlight winseparator guifg=white]])
		end,
	},

	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("tokyonight").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				style = "night", -- the theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
				light_style = "day", -- the theme is used when the background is set to light
				transparent = false,
				terminal_colors = true, -- configure the colors used when opening a `:terminal` in [neovim](https://github.com/neovim/neovim)
				styles = {
					-- style to be applied to different syntax groups
					-- value is any valid attr-list value for `:help nvim_set_hl`
					comments = { italic = true },
					keywords = { italic = false, bold = true },
					functions = {},
					variables = {},
					-- background styles. can be "dark", "transparent" or "normal"
					sidebars = "dark", -- style for sidebars, see below
					floats = "dark", -- style for floating windows
				},
				sidebars = { "qf", "help" }, -- set a darker background on sidebar-like windows. for example: `["qf", "vista_kind", "terminal", "packer"]`
				day_brightness = 0.3, -- adjusts the brightness of the colors of the **day** style. number between 0 and 1, from dull to vibrant colors
				hide_inactive_statusline = false, -- enabling this option, will hide inactive statuslines and replace them with a thin border instead. should work with the standard **statusline** and **lualine**.
				dim_inactive = false, -- dims inactive windows
				lualine_bold = true, -- when `true`, section headers in the lualine theme will be bold

				--- you can override specific color groups to use other groups or a hex color
				--- function will be called with a colorscheme table
				---@param colors colorscheme
				on_colors = function(colors) end,

				--- you can override specific highlights to use other groups or a hex color
				--- function will be called with a highlights and colorscheme table
				---@param highlights highlights
				---@param colors colorscheme
				on_highlights = function(highlights, colors) end,
			})
			-- vim.cmd([[colorscheme tokyonight]])
			vim.opt.laststatus = 3
			vim.cmd([[highlight winseparator guibg=none]])
			vim.cmd([[highlight winseparator guifg=white]])
		end,
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				background = { -- :h background
					light = "latte",
					dark = "mocha",
				},
				transparent_background = false, -- disables setting the background color.
				show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
				term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
				dim_inactive = {
					enabled = false, -- dims the background color of inactive window
					shade = "dark",
					percentage = 0.1, -- percentage of the shade to apply to the inactive window
				},

				no_italic = false, -- force no italic
				no_bold = false, -- force no bold
				no_underline = false, -- force no underline
				styles = { -- handles the styles of general hi groups (see `:h highlight-args`):
					comments = { "italic" }, -- change the style of comments
					conditionals = { "italic" },
					loops = {},
					functions = {},
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
					operators = {},
				},
				color_overrides = {},
				custom_highlights = {},
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					notify = false,
					mini = {
						enabled = true,
						indentscope_color = "",
					},
					-- for more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
				},
			})
		end,
	},
}
