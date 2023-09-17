return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}, -- this is equalent to setup({}) functionopt.backspace = indent,eol,start
    config = function()
		require("nvim-autopairs").setup() -- Automated insert of closing braces
    end,
}
