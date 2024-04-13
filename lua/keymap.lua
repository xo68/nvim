local keymap = vim.keymap
local api = vim.api
vim.g.mapleader = " "

-- MacBook Swiss Keyboard remapping, test mac key with $sed -n l
keymap.set("n", "è", "<C-]>", { desc = "CTRL-] to navigate in documentation (Swiss key) " })

-- hlsearch, disable all highlighted resutls
keymap.set("n", "<ESC>", "<cmd>nohlsearch<CR>", { desc = "Clean-up hihglighted searches" })

-- Macros (When macro is stored in register in 'q')
keymap.set("n", "Q", "@qj", { desc = "Macro - Remapping of 'Q'" })
keymap.set("x", "Q", ":norm @q<cr>", { desc = "Macro - Remapping of 'Q'" })

-- Show colum 80
keymap.set("n", "<leader>cc", ":set colorcolumn=80<cr>", { desc = "set option - [c]olor [c]olumn = 80" })
keymap.set("n", "<leader>cC", ":set colorcolumn=0<cr>", { desc = "set option - [c]olor [c]olumn = 0" })

-- Smart escape
keymap.set("i", "kj", "<ESC>", { desc = "Fast escape" })
keymap.set("i", "jk", "<ESC>", { desc = "Fast escape" })

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
keymap.set("n", "<C-j>", ":m .+1<CR>==", { desc = "Move - line up/down (normal mode)" })
keymap.set("n", "<C-k>", ":m .-2<CR>==", { desc = "Move - line up/down (normal mode)" })
keymap.set("v", "<C-j>", ":m .+1<CR>==", { desc = "Move - Text up/down (Visual mode)" })
keymap.set("v", "<C-k>", ":m .-2<CR>==", { desc = "Move - Text up/down (Visual mode)" })
keymap.set("x", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move - Text up/down (Visual block mode)" })
keymap.set("x", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move - Text up/down (Visual block mode)" })

-- Buffers
keymap.set("n", "<leader>bn", "<cmd>:bnext<CR>", { desc = "Buffer - [b]uffer [n]ext" })
keymap.set("n", "<leader>bp", "<cmd>:bprevious<CR>", { desc = "Buffer - [b]uffer [p]revious" })
keymap.set("n", "<leader>bl", ":Telescope buffers <cr>", { desc = "Buffer - [b]uffer [l]ist (Telescope)" })
-- LSP
keymap.set(
	"n",
	"<leader>li",
	":lua print(vim.inspect(vim.lsp.get_active_clients())) <cr>",
	{ desc = "LSP - [l]sp [i]nspect)" }
)

--[[ PLUGIN SPECIFIC KEYMAPS]]
-- Nvim-tree -> ./plugins/nvim-tree.lua
-- Nvim-telescope -> ./plugins/telescope.lua
-- Nvim-maximizer -> ./plugins/vim-maximizer.lua
-- Harpoon2 -> ./plugins/harpoon.lua
-- Formatter (conform) -> ./plugins/formatter.lua
-- Linter (nvim-lint) -> ./plugins/linter.lua
-- Trouble -> ./plugins/trouble.lua
-- Flash -> ./plugins/flash.lua
-- Markdow -> ./plugins/markdown.lua

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
-- keymap.set({}, '<Leader>dh', function() require('dap.ui.widgets').hover() end)
-- keymap.set({'n', 'v'}, '<Leader>dp', function() require('dap.ui.widgets').preview() end)
-- keymap.set('n', '<Leader>df', function() local widgets = require('dap.ui.widgets') widgets.centered_float(widgets.frames) end)
-- keymap.set('n', '<Leader>ds', function() local widgets = require('dap.ui.widgets') widgets.centered_float(widgets.scopes) end)
