return {
    "ThePrimeagen/harpoon",
    dependencies = {"nvim-lua/plenary.nvim",},

    config = function()

        -- local keymap = vim.keymap -- for conciseness
        -- local mark = require("harpoon.mark")
        -- local ui = require("harpoon.ui")

        -- keymap.set("n", "<leader>hm", mark.add_file, {desc ="Harpoon - Mark file"}) -- Mark file with Harpoon
        -- keymap.set("n", "<leader>hh", ui.toggle_quick_menu, {desc ="Harpoon - Open menu"}) -- Mark file with Harpoon
        -- keymap.set("n", "<leader>hn", ui.nav_next, { desc = "Harpoon - Go to next mark" })
        -- keymap.set("n", "<leader>hp", ui.nav_prev, { desc = "Harpoon - Go to previous mark" })

        -- In case of integration with Telescope
        -- require("telescope").load_extension('harpoon')
        -- :Telescope harpoon marks --Only Marks are supported yet
    end,
}
