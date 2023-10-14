local keymap = vim.keymap
local api = vim.api
vim.g.mapleader = " "

-- MacBook Swiss Keyboard remapping, test mac key with $sed -n l
keymap.set("n", "è", "<C-]>") -- Easier navigation in help

-- Default vim explorer
keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Smart escape
keymap.set("i", "jk", "<ESC>")
keymap.set("i", "kj", "<ESC>")

-- Scroll and center cursor
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

-- SPLIT window management
keymap.set("n", "<leader>v", ":vsplit ", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>s", ":split ", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>eq", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- SPLIT window resize (MacOs Option key)
keymap.set("n", "<M-j>", "5<C-w>+", { desc = "Split - resize horizontal +" })
keymap.set("n", "<M-k>", "5<C-w>-", { desc = "Split - resize horizontal -" })
keymap.set("n", "<M-h>", "5<C-w>>", { desc = "Split - resize vertical -" })
keymap.set("n", "<M-l>", "5<C-w><", { desc = "Split - resize vertical +" })

-- TAB window management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tb", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Visual mode
keymap.set("v", ">", ">gv", { desc = "Indent - Left (Visual mode)" })
keymap.set("v", "<", "<gv", { desc = "Indent - Right (Visual mode)" })
keymap.set("v", "<C-j>", ":m .+1<CR>==", { desc = "Move text up/down (Visual mode)" })
keymap.set("v", "<C-k>", ":m .-2<CR>==", { desc = "Move text up/down (Visual mode)" })
keymap.set("x", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move text up/down (Visual block mode)" })
keymap.set("x", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move text up/down (Visual block mode)" })

-- Buffers
keymap.set("n", "<leader>bn", "<cmd>:bnext<CR>", { desc = "Buffer: Next" })
keymap.set("n", "<leader>bp", "<cmd>:bprevious<CR>", { desc = "Buffer: Previous" })
keymap.set("n", "<leader>bl", "<cmd>:ls<CR>", { desc = "Buffer: List" })

-- Nvim-tree
keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer

-- Nvim-telescope
keymap.set("n", "<leader>ff", ":Telescope find_files <cr>", { desc = "Telescope: [f]ind [f]iles" })
keymap.set("n", "<leader>fg", ":Telescope live_grep <cr>", { desc = "Telescope: [f]ile [g]rep" })
keymap.set("n", "<leader>fb", ":Telescope buffers <cr>", { desc = "Telescope: [f]ile [b]uffers" })
keymap.set("n", "<leader>fh", ":Telescope help_tags <cr>", { desc = "Telescope: [f]ile [h]elp tags" })
keymap.set("n", "<leader>fs", ":Telescope current_buffer_fuzzy_find <cr>", { desc = "Telescope: [f]ile [s]earch" })
keymap.set("n", "<leader>fo", ":Telescope oldfiles <cr>", { desc = "Telescope: [f]ile [o]ld" })
keymap.set("n", "<leader>fm", ":Telescope marks <cr>", { desc = "Telescope: [f]ile [o]ld" })

-- Nvim-maximaizer
keymap.set("n", "<leader>m", ":MaximizerToggle <cr>", { desc = "max/min splitview" })

-- Harpoon
keymap.set("n", "<leader>hm", ":lua require('harpoon.mark').add_file()<cr><C-l>", { desc = "Harpoon - mark file" })
keymap.set(
	"n",
	"<leader>hh",
	":lua require('harpoon.ui').toggle_quick_menu() <cr><C-l>",
	{ desc = "Harpoon - open menu" }
)
keymap.set("n", "<leader>hn", ":lua require('harpoon.ui').nav_next()<cr><C-l>", { desc = "Harpoon - go to next mark" })
keymap.set(
	"n",
	"<leader>hp",
	":lua require('harpoon.ui').nav_prev()<cr><C-l>",
	{ desc = "Harpoon - go to previous mark" }
)
--
-- Formatter / Conform plugin
keymap.set(
	{ "n", "v" },
	"<leader>lf",
	':lua require("conform").format({ lsp_fallback = false, async = true, timeout_ms = 500, })<cr><C-l>',
	{ desc = "Language - Formatter (Conform plugin)" }
)

-- Linter
keymap.set("n", "<leader>ll", ':lua require("lint").try_lint()<cr><C-l>', { desc = "Language - Linter" })

-- Language specific
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	-- pattern = {"*.py", "*.h"},
	pattern = { "*.py" },
	callback = function()
		vim.keymap.set(
			"n",
			"<leader>ld",
			':execute "!pydoc3 " . expand("<cword>")<CR>',
			{ desc = "Language - Documentation (e.g. pydoc)", silent = true, buffer = true }
		)
	end,
})

-- debugger / todo
-- keymap.set('n', '<f5>', function() require('dap').continue() end)
-- keymap.set('n', '<f11>', function() require('dap').step_over() end)
-- keymap.set('n', '<f10>', function() require('dap').step_into() end)
-- keymap.set('n', '<f12>', function() require('dap').step_out() end)
-- keymap.set('n', '<leader>db', function() require('dap').toggle_breakpoint() end)
-- keymap.set('n', '<leader>db', function() require('dap').set_breakpoint() end)
-- keymap.set('n', '<leader>dpp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('log point message: ')) end)
-- keymap.set('n', '<leader>dr', function() require('dap').repl.open() end)
-- keymap.set('n', '<leader>dl', function() require('dap').run_last() end)
-- keymap.set({'n', 'v'}, '<Leader>dh', function() require('dap.ui.widgets').hover() end)
-- keymap.set({'n', 'v'}, '<Leader>dp', function() require('dap.ui.widgets').preview() end)
-- keymap.set('n', '<Leader>df', function() local widgets = require('dap.ui.widgets') widgets.centered_float(widgets.frames) end)
-- keymap.set('n', '<Leader>ds', function() local widgets = require('dap.ui.widgets') widgets.centered_float(widgets.scopes) end)
