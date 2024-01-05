return {
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
				disable_background = true,
				disable_float_background = true,
				disable_italics = true,

				--- @usage string hex value or named color from rosepinetheme.com/palette
				groups = {
					background = "base",
					background_nc = "_experimental_nc",
					panel = "surface",
					panel_nc = "base",
					border = "highlight_med",
					comment = "muted",
					link = "iris",
					punctuation = "subtle",

					error = "love",
					hint = "iris",
					info = "foam",
					warn = "gold",

					headings = {
						h1 = "iris",
						h2 = "foam",
						h3 = "rose",
						h4 = "gold",
						h5 = "pine",
						h6 = "foam",
					},
					-- or set all headings at once
					-- headings = "subtle",
				},

				-- change specific vim highlight groups
				-- https://github.com/rose-pine/neovim/wiki/recipes
				highlight_groups = {
					colorcolumn = { bg = "rose" },

					-- blend colours against the "base" background
					cursorline = { bg = "foam", blend = 10 },
					statusline = { fg = "love", bg = "love", blend = 10 },

					-- by default each group adds to the existing config.
					-- if you only want to set what is written in this config exactly,
					-- you can set the inherit option:
					search = { bg = "gold", inherit = false },
				},
			})

			-- set colorscheme after options
			vim.cmd("colorscheme rose-pine-moon")
			vim.opt.laststatus = 3
			vim.cmd([[highlight winseparator guibg=none]])
			vim.cmd([[highlight winseparator guifg=white]])
		end,
	},
	{
		-- "tanvirtin/monokai.nvim",
		"loctvl842/monokai-pro.nvim",
		config = function()
			require("monokai-pro").setup({
				transparent_background = true,
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
					-- "float_win",
					"toggleterm",
					"telescope",
					-- "which-key",
					"renamer",
					"notify",
					-- "nvim-tree",
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
					transparent = true, -- Disable setting background
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
						keywords = "NONE",
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
				transparent = true, -- enable this to disable setting the background color
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
					floats = "normal", -- style for floating windows
				},
				sidebars = { "qf", "help" }, -- set a darker background on sidebar-like windows. for example: `["qf", "vista_kind", "terminal", "packer"]`
				day_brightness = 0.3, -- adjusts the brightness of the colors of the **day** style. number between 0 and 1, from dull to vibrant colors
				hide_inactive_statusline = false, -- enabling this option, will hide inactive statuslines and replace them with a thin border instead. should work with the standard **statusline** and **lualine**.
				dim_inactive = true, -- dims inactive windows
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
				transparent_background = true, -- disables setting the background color.
				show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
				term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
				dim_inactive = {
					enabled = true, -- dims the background color of inactive window
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

			-- setup must be called before loading
			-- vim.cmd.colorscheme("catppuccin-mocha")
			-- vim.cmd.colorscheme("catppuccin-macchiato")
			vim.opt.laststatus = 3
			vim.cmd([[highlight winseparator guibg=none]])
			vim.cmd([[highlight winseparator guifg=white]])
		end,
	},
}
