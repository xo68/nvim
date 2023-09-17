local keymap = vim.keymap
local api = vim.api
vim.g.mapleader = " "

-- MacBook Swiss Keyboard remapping
-- test mac key $sed -n l

-- Insert, Normal & cmd-line mode
api.nvim_set_keymap('!', '¶', '}', { noremap = true })
api.nvim_set_keymap('!', '§', '[', { noremap = true })
api.nvim_set_keymap('!', '‘', ']', { noremap = true })
api.nvim_set_keymap('n', 'æ', '{', { noremap = true })
api.nvim_set_keymap('n', 'æ', '{', { noremap = true })
api.nvim_set_keymap('n', '¶', '}', { noremap = true })
api.nvim_set_keymap('n', '§', '[', { noremap = true })
api.nvim_set_keymap('n', '‘', ']', { noremap = true })

-- Easier navigation in help
keymap.set("n", "è", "<C-]>")

-- Default vim explorer
keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

-- SPLIT window management [s - split]
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Resize split view (Mac keyboard)
keymap.set("n", "ª", ":vertical resize -10 <cr>") -- Mac <Option-h> key
keymap.set("n", "¬", ":vertical resize +10 <cr>") -- Mac <Option-l> key
keymap.set("n", "∆", ":resize -10 <cr>") -- Mac <Option-k> key
keymap.set("n", "º", ":resize +10 <cr>") -- Mac <Option-j> key

-- TAB window management [t - Tab]
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Visual mode
keymap.set("v", ">", ">gv", { desc = "Indent - Left (Visual mode)" })
keymap.set("v", "<", "<gv", { desc = "Indent - Right (Visual mode)" })
keymap.set("v", "<C-j>", ":m .+1<CR>==", { desc = "Move text up/down (Visual mode)" })
keymap.set("v", "<C-k>", ":m .-2<CR>==", { desc = "Move text up/down (Visual mode)" })
keymap.set("x", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move text up/down (Visual block mode)" })
keymap.set("x", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move text up/down (Visual block mode)" })

-- Buffers [b - Buffer]
keymap.set("n", "<leader>bn", "<cmd>:bnext<CR>", { desc = "Buffer: Next" })
keymap.set("n", "<leader>bp", "<cmd>:bprevious<CR>", { desc = "Buffer: Previous" })
keymap.set("n", "<leader>bl", "<cmd>:ls<CR>", { desc = "Buffer: List" })

-- nvim-tree [e - Explorer]
keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer

-- nvim-telescope [f - Find]
keymap.set('n', '<leader>ff', ":Telescope find_files <cr>", {desc="Telescope: [F]ind [F]iles"})
keymap.set('n', '<leader>fg', ":Telescope live_grep <cr>", {desc="Telescope: [F]ile [G]rep"})
keymap.set('n', '<leader>fb', ":Telescope buffers <cr>", {desc="Telescope: [F]ile [B]uffers"})
keymap.set('n', '<leader>fh', ":Telescope help_tags <cr>", {desc="Telescope: [F]ile [H]elp Tags"})

-- nvim-maximaizer
keymap.set("n", "<leader>m", ":MaximizerToggle <cr>", { desc = "Max/Min splitview" })

-- nvim LSP -> In LSP config lua file
-- gr         -> Go reference
-- gd         -> Go definitions
-- gD         -> Go References
-- gi         -> Go Implementation
-- gt         -> Go Type definitions
-- <leader>rn -> Smart rename
-- <leader>rs -> restart LSP 
-- K          -> Documentation what's under cursor

-- nvrim-tree (Default setup)
-- ctrl-t     -> Open file in new tab
-- ctrl-v     -> Open in vertical split
-- ctrl-x     -> Open in horizontal split
-- Enter or o -> Open in a new buffer
-- Tab        -> Open in a new buffer but stay in the Tree
-- a          -> Create a new file / folder
-- d          -> Delete a file or folder

-- nvim-cmp -> In cmp config file 
-- ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
-- ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
-- ["<C-u>"] = cmp.mapping.scroll_docs(-4),
-- ["<C-d>"] = cmp.mapping.scroll_docs(4),
-- ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
-- ["<C-e>"] = cmp.mapping.abort(), -- close completion window
-- ["<CR>"] = cmp.mapping.confirm({ select = false }),





-- Debugger
-- TODO: 
-- Add conditional breakpoint
keymap.set('n', '<F5>', function() require('dap').continue() end)
keymap.set('n', '<F11>', function() require('dap').step_over() end)
keymap.set('n', '<F10>', function() require('dap').step_into() end)
keymap.set('n', '<F12>', function() require('dap').step_out() end)
keymap.set('n', '<Leader>db', function() require('dap').toggle_breakpoint() end)
keymap.set('n', '<Leader>dB', function() require('dap').set_breakpoint() end)
keymap.set('n', '<Leader>dpp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
keymap.set({'n', 'v'}, '<Leader>dh', function()
    require('dap.ui.widgets').hover()
end)
keymap.set({'n', 'v'}, '<Leader>dp', function()
    require('dap.ui.widgets').preview()
end)
keymap.set('n', '<Leader>df', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames)
end)
keymap.set('n', '<Leader>ds', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
end)
