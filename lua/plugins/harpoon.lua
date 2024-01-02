return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },

	config = function()
		local harpoon = require("harpoon")
		harpoon.setup()

		-- TODO: build a new function to remove item from harpoon list, from Telescope
		--
		-- local actions_state = require("telescope.actions.state")
		-- local actions = require("telescope.actions")
		-- local print_selected_entry = function(prompt_bufnr)
		-- 	local selected_entry = actions_state.get_selected_entry()
		-- 	vim.pretty_print(selected_entry)
		-- 	actions.close(prompt_bufnr)
		-- end
		-- require("telescope.builtin").find_files({
		-- 	attach_mappings = function(_, map)
		-- 		map("n", "<cr>", print_selected_entry)
		-- 		map("i", "<cr>", print_selected_entry)
		-- 		return true
		-- 	end,
		-- })

		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end

		vim.keymap.set("n", "<leader>hl", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Harpoon - [h]arpoon [l]ist (via Telescope)" })

		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():append()
		end, { desc = "Harpoon - [h]arpoon [a]ppend" })

		vim.keymap.set("n", "<leader>hc", function()
			harpoon:list():clear()
		end, { desc = "Harpoon - [h]arpoon [c]lear list" })

		vim.keymap.set("n", "<leader>hr", function()
			harpoon:list():remove()
		end, { desc = "Harpoon - [h]arpoon [r]remove current item" })

		-- cycling when hitting first or last element
		local opts = { ui_nav_wrap = true }

		vim.keymap.set("n", "<leader>p", function()
			harpoon:list():prev(opts)
		end, { desc = "Harpoon - [p]revious item" })

		vim.keymap.set("n", "<leader>n", function()
			harpoon:list():next(opts)
		end, { desc = "Harpoon - [n]ext item" })
	end,
}
