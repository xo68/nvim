local keymap = vim.keymap
local api = vim.api
vim.g.mapleader = " "

-- MacBook Swiss Keyboard remapping, test mac key with $sed -n l
keymap.set("n", "è", "<C-]>", { desc = "Jump to a subject in documentation (= CTRL-])" })

-- Default vim explorer
-- keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open Netrw file explorer" })

-- Smart escape
keymap.set("i", "jk", "<ESC>", { desc = "Fast escape" })
keymap.set("i", "kj", "<ESC>", { desc = "Fast escape" })

-- Scroll and center cursor
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll - [d]own & Center cursor on the screen" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll - [u]p & Center cursor on the screen" })

-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Split - Select Left (h)" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Split - Select Down (j)" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Split - Select Up (k)" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Split - Select Right (l)" })

-- SPLIT window management
keymap.set("n", "<leader>sv", ":vsplit ", { desc = "Split - [s]plit [v]ertical" })
keymap.set("n", "<leader>sh", ":split ", { desc = "Split - [s]plit [h]orizontal" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Split - [s]plit [e]qual size" })
keymap.set("n", "<leader>sc", "<cmd>close<CR>", { desc = "Split - [s]plit [c]lose current" })

-- SPLIT window resize (MacOs Option key)
keymap.set("n", "<M-j>", "5<C-w>+", { desc = "Split - Resize horizontal +" })
keymap.set("n", "<M-k>", "5<C-w>-", { desc = "Split - Resize horizontal -" })
keymap.set("n", "<M-h>", "5<C-w>>", { desc = "Split - Resize vertical -" })
keymap.set("n", "<M-l>", "5<C-w><", { desc = "Split - Resize vertical +" })

-- TAB window management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Tab - [t]ab [o]pen" })
keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Tab - [t]ab [c]lose" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Tab - [t]ab [n]ext" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Tab - [t]ab [p]revious" })
keymap.set("n", "<leader>tb", "<cmd>tabnew %<CR>", { desc = "Tab - [t]ab open current [b]uffer" })

-- Visual mode
keymap.set("v", ">", ">gv", { desc = "Indent - Left (Visual mode)" })
keymap.set("v", "<", "<gv", { desc = "Indent - Right (Visual mode)" })
keymap.set("v", "<C-j>", ":m .+1<CR>==", { desc = "Move - Text up/down (Visual mode)" })
keymap.set("v", "<C-k>", ":m .-2<CR>==", { desc = "Move - Text up/down (Visual mode)" })
keymap.set("x", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move - Text up/down (Visual block mode)" })
keymap.set("x", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move - Text up/down (Visual block mode)" })

-- Buffers
keymap.set("n", "<leader>bn", "<cmd>:bnext<CR>", { desc = "Buffer - [b]uffer [n]ext" })
keymap.set("n", "<leader>bp", "<cmd>:bprevious<CR>", { desc = "Buffer - [b]uffer [p]revious" })
keymap.set("n", "<leader>bl", ":Telescope buffers <cr>", { desc = "Buffer - [b]uffer [l]ist (Telescope)" })

-- Nvim-tree
keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "NvimTree - [e]xplorer Toggle" })
keymap.set(
	"n",
	"<leader>ef",
	"<cmd>NvimTreeFindFileToggle<CR>",
	{ desc = "NvimTree - [e]xplorer Toggle for current [f]ile folder" }
)
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "NvimTree - [e]xplorer [r]efresh" })

-- Nvim-telescope
keymap.set("n", "<leader>ft", ":TodoTelescope <cr>", { desc = "Telescope: [f]ind [t]odo " })
keymap.set("n", "<leader>fM", ":Telescope man_pages <cr>", { desc = "Telescope: [f]ind [M]an pages" })
keymap.set("n", "<leader>fk", ":Telescope keymaps <cr>", { desc = "Telescope: [f]ind [k]eymaps" })
keymap.set("n", "<leader>ff", ":Telescope find_files <cr>", { desc = "Telescope: [f]ind [f]iles" })
keymap.set("n", "<leader>fg", ":Telescope live_grep <cr>", { desc = "Telescope: [f]ile [g]rep" })
keymap.set("n", "<leader>fb", ":Telescope buffers <cr>", { desc = "Telescope: [f]ile [b]uffers" })
keymap.set("n", "<leader>fh", ":Telescope help_tags <cr>", { desc = "Telescope: [f]ile [h]elp tags" })
keymap.set("n", "<leader>fo", ":Telescope oldfiles <cr>", { desc = "Telescope: [f]ile [o]ld files / History" })
keymap.set("n", "<leader>fm", ":Telescope marks <cr>", { desc = "Telescope: [f]ile [m]arks" })
keymap.set("n", "<leader>fs", ":Telescope current_buffer_fuzzy_find <cr>", { desc = "Telescope: [f]ile [s]earch" })
keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		-- winblend = 30,
		previewer = false,
	}))
end, { desc = "Telescope: [/] Fuzzily search in current buffer" })

-- Nvim-maximizer -> ./plugins/vim-maximizer.lua
-- Harpoon -> ./plugins/harpoon.lua
-- Formatter (conform) -> ./plugins/formatter.lua
-- Linter (nvim-lint) -> ./plugins/linter.lua

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
