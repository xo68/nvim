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
		local keymap = vim.keymap
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		keymap.set("n", "<leader>ft", ":TodoTelescope <cr>", { desc = "Telescope: [f]ind [t]odo (workspace)" })
		keymap.set("n", "<leader>fM", ":Telescope man_pages <cr>", { desc = "Telescope: [f]ind [M]an pages" })
		keymap.set("n", "<leader>fk", ":Telescope keymaps <cr>", { desc = "Telescope: [f]ind [k]eymaps" })
		keymap.set("n", "<leader>ff", ":Telescope find_files <cr>", { desc = "Telescope: [f]ind [f]iles (workspace)" })
		keymap.set(
			"n",
			"<leader>fg",
			":Telescope live_grep <cr>",
			{ desc = "Telescope: [f]ile [g]rep live (workspace)" }
		)
		keymap.set(
			"n",
			"<leader>fG",
			":Telescope grep_string <cr>",
			{ desc = "Telescope: [f]ind [G]rep word under cursor (workspace)" }
		)
		keymap.set("n", "<leader>fb", ":Telescope buffers <cr>", { desc = "Telescope: [f]ind [b]uffers" })
		keymap.set("n", "<leader>fh", ":Telescope help_tags <cr>", { desc = "Telescope: [f]ind [h]elp" })
		keymap.set("n", "<leader>fo", ":Telescope oldfiles <cr>", { desc = "Telescope: [f]ind [o]ld files / History" })
		keymap.set("n", "<leader>fm", ":Telescope marks <cr>", { desc = "Telescope: [f]ind [m]arks all" })
		keymap.set(
			"n",
			"<leader>fS",
			":Telescope lsp_document_symbols <cr>",
			{ desc = "Telescope: [f]ile [S]ymbols (buffer)" }
		)
		keymap.set(
			"n",
			"<leader>fs",
			":Telescope current_buffer_fuzzy_find <cr>",
			{ desc = "Telescope: [f]ile [s]earch fuzzy (buffer)" }
		)
		keymap.set("n", "<leader>/", function()
			-- You can pass additional configuration to telescope to change theme, layout, etc.
			require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				-- winblend = 30,
				previewer = false,
			}))
		end, { desc = "Telescope: [/] Fuzzily search (buffer)" })
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
						["<C-u>"] = actions.preview_scrolling_up,
						["<C-d>"] = actions.preview_scrolling_down,

						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<C-n>"] = actions.cycle_history_next,
						["<C-p>"] = actions.cycle_history_prev,
						["<C-c>"] = actions.close,
						["<Down>"] = actions.move_selection_next,
						["<Up>"] = actions.move_selection_previous,
						["<CR>"] = actions.select_default,
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
						["<C-u>"] = actions.preview_scrolling_up,
						["<C-d>"] = actions.preview_scrolling_down,

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
