return {
	{
		{
			"jellydn/CopilotChat.nvim",
			opts = {
				mode = "split", -- can be set to "newbuffer" or "split", default: newbuffer
				prompts = {
					-- Code related prompts
					Explain = "Please explain how the following code works",
					Review = "Pleaseprovide suggestions for improvement",
					Tests = "Please generate unit tests",
					Refactor = "Please refactor the following code to improve its clarity and readability.",
					-- Text related prompts
					Summarize = "Please summarize the following text",
					Spelling = "Please correct any grammar and spelling errors in the following text",
					Wording = "Please improve the grammar and wording of the following text",
					Concise = "Please rewrite the following text to make it more concise",
				},
			},
			build = function()
				vim.defer_fn(function()
					vim.cmd("UpdateRemotePlugins")
					vim.notify("CopilotChat - Updated remote plugins. Please restart Neovim.")
				end, 3000)
			end,
			event = "VeryLazy",
			keys = {
				-- The following shortcuts will call "copilotchat" and trigger the corresponding prompt
				-- Copilot will read the currently yanked content in the default register
				-- In short -> Select the code -> Yank it 'y' -> Trigger one of the bellow the shortcut
				-- In this current setup <leader> is set to <space>
				{ "<leader>ae", "<cmd>CopilotChatExplain<cr>", desc = "Copilot - [a]ssist [e]xplain code" },
				{ "<leader>at", "<cmd>CopilotChatTests<cr>", desc = "Copilot - [a]ssist generate [t]ests" },
				{ "<leader>ar", "<cmd>CopilotChatReview<cr>", desc = "Copilot - [a]ssist [r]eview code" },
				{ "<leader>aR", "<cmd>CopilotChatRefactor<cr>", desc = "Copilot - [a]ssist [R]efactor code" },
				{ "<leader>as", "<cmd>CopilotChatSummarize<cr>", desc = "Copilot - [a]ssist [s]ummarize text" },
				{ "<leader>aw", "<cmd>CopilotChatWording<cr>", desc = "Copilot - [a]ssist improve [w]ording" },
				{ "<leader>ac", "<cmd>CopilotChatSpelling<cr>", desc = "Copilot - [a]ssist [c]orrect spelling" },
				{ "<leader>aC", "<cmd>CopilotChatConcise<cr>", desc = "Copilot - [a]ssist make text [c]oncise" },
			},
		},
	},
	{
		"github/copilot.vim",
		config = function()
			vim.keymap.set("i", "<C-c>", 'copilot#Accept("\\<CR>")', {
				expr = true,
				replace_keycodes = false,
				desc = "Copilot - Accept suggestion on the screen",
			})
			vim.g.copilot_no_tab_map = true
			vim.keymap.set("i", "<C-v>", "<Plug>(copilot-next)", { desc = "Copilot - Next suggestion" })
			vim.keymap.set("i", "<C-x>", "<Plug>(copilot-previous)", { desc = "Copilot - Previous suggestion" })
		end,
	},
}
