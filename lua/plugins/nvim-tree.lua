return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local nvimtree = require("nvim-tree")

		vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "NvimTree - [e]xplorer Toggle" })
		vim.keymap.set(
			"n",
			"<leader>ef",
			"<cmd>NvimTreeFindFileToggle<CR>",
			{ desc = "NvimTree - [e]xplorer Toggle for current [f]ile folder" }
		)
		vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "NvimTree - [e]xplorer [r]efresh" })

		-- recommended settings from nvim-tree documentation
		-- vim.g.loaded_netrw = 1
		-- vim.g.loaded_netrwPlugin = 1

		-- change color for arrows in tree to light blue
		vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

		-- configure nvim-tree
		nvimtree.setup({
			view = {
				width = 30,
				-- mappings = {
				--     list = {
				--         { key = "<C-v>", action = "" }, -- vsplit
				--         { key = "<C-x>", action = "" }, -- split
				--         { key = "<C-t>", action = "" }, -- tabnew
				--         { key = "<BS>", action = "" }, -- close_node
				--         { key = "<Tab>", action = "" }, -- preview
				--
				--         { key = "D", action = "" }, -- trash
				--         { key = { "<2-RightMouse>", "<C-]>" }, action = "" }, -- cd
				--         { key = "[e", action = "" }, -- prev_diag_item
				--         { key = "]e", action = "" }, -- next_diag_item
				--         { key = "[c", action = "" }, -- prev_git_item
				--         { key = "]c", action = "" }, -- next_git_item
				--         { key = "-", action = "" }, -- dir_up
				--         { key = "s", action = "" }, -- system_open
				--         { key = "W", action = "" }, -- collapse_all
				--         { key = "g?", action = "" }, -- toggle_help
				--         { key = "d", action = "cd" }, -- remove
				--         { key = "x", action = "remove" }, -- cut
				--         { key = "t", action = "cut" },
				--         { key = "<Space>p", action = "prev_diag_item" },
				--         { key = "<Space>.", action = "next_diag_item" },
				--         { key = "<Space>k", action = "prev_git_item" },
				--         { key = "<Space>j", action = "next_git_item" },
				--         { key = "u", action = "dir_up" },
				--         { key = "'", action = "close_node" },
				--         { key = '"', action = "collapse_all" },
				--         { key = "?", action = "toggle_help" },
				--     },
			},
			-- change folder arrow icons
			renderer = {
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "", -- arrow when folder is closed
							arrow_open = "", -- arrow when folder is open
						},
					},
				},
			},
			-- disable window_picker for
			-- explorer to work well with
			-- window splits
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				custom = { ".DS_Store" },
			},
			git = {
				ignore = false,
			},
		})
	end,
}
