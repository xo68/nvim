return {
	-- Install rg & fd depandancies
	-- e.g. $brew install rg (RipGrep)
	-- e.g. $brew install fd (Faster find)
	-- Validate the setup with :checkhealth telescope

	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	-- or branch = '0.1.x',

	dependencies = { "nvim-lua/plenary.nvim" },

	config = function()
		local k = vim.keymap
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		-- k.set('n', '<leader>ff', builtin.find_files, {desc="Telescope: [F]ind [F]iles"})
		-- k.set('n', '<leader>fg', builtin.live_grep, {desc="Telescope: [F]ile [G]rep"})
		-- k.set('n', '<leader>fb', builtin.buffers, {desc="Telescope: [F]ile [B]uffers"})
		-- k.set('n', '<leader>fh', builtin.help_tags, {desc="Telescope: [F]ile [H]elp Tags"})
		-- builtin.diagnostics({ severity_bound = 0 })

		telescope.setup({
			defaults = {

				prompt_prefix = "$ ",
				selection_caret = ">> ",
				path_display = { "smart" },

				mappings = {
					i = {
						["<C-h>"] = actions.select_horizontal, -- Open in new horizontal tab
						["<C-v>"] = actions.select_vertical, -- Open in new vertical tab
						["<C-t>"] = actions.select_tab, -- Open in a new tab
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result

						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<C-n>"] = actions.cycle_history_next,
						["<C-p>"] = actions.cycle_history_prev,
						["<C-c>"] = actions.close,
						["<Down>"] = actions.move_selection_next,
						["<Up>"] = actions.move_selection_previous,
						["<CR>"] = actions.select_default,
						["<C-u>"] = actions.preview_scrolling_up,
						["<C-d>"] = actions.preview_scrolling_down,
						["<PageUp>"] = actions.results_scrolling_up,
						["<PageDown>"] = actions.results_scrolling_down,
						["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
						["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
						["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<C-l>"] = actions.complete_tag,
						["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
					},
					n = {
						["<C-h>"] = actions.select_horizontal, -- Open in new horizontal tab
						["<C-v>"] = actions.select_vertical, -- Open in new vertical tab
						["<C-t>"] = actions.select_tab, -- Open in a new tab

						["<esc>"] = actions.close,
						["<CR>"] = actions.select_default,
						["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
						["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
						["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
						["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["j"] = actions.move_selection_next,
						["k"] = actions.move_selection_previous,
						["H"] = actions.move_to_top,
						["M"] = actions.move_to_middle,
						["L"] = actions.move_to_bottom,
						["<Down>"] = actions.move_selection_next,
						["<Up>"] = actions.move_selection_previous,
						["gg"] = actions.move_to_top,
						["G"] = actions.move_to_bottom,
						["<C-u>"] = actions.preview_scrolling_up,
						["<C-d>"] = actions.preview_scrolling_down,
						["<PageUp>"] = actions.results_scrolling_up,
						["<PageDown>"] = actions.results_scrolling_down,
						["?"] = actions.which_key,
					},
				},
			},
		})
	end,

	pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
		-- planets = {
		-- show_pluto = true,
		-- },
	},

	extensions = {
		-- Your extension configuration goes here:
		-- extension_name = {
		--   extension_config_key = value,
		-- }
		-- please take a look at the readme of the extension you want to configure
	},
}
