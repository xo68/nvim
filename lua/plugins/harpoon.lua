return {
  "ThePrimeagen/harpoon",
  dependencies = {"nvim-lua/plenary.nvim",},

  config = function()
    local keymap = vim.keymap -- for conciseness
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    keymap.set("n", "<leader>hm", mark.add_file) -- Mark file with Harpoon
    keymap.set("n", "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", { desc = "Go to next harpoon mark" })
    keymap.set("n", "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", { desc = "Go to previous harpoon mark" })
    -- TODO: Add Toogle menu and additional shortcuts !
  end,
}
