return {
    'mfussenegger/nvim-lint',
    config = function()
        local lint = require('lint')

        lint.linters_by_ft = {
            -- python linter mypy not required as LSP is doing the job
            -- python = {'mypy'}
        }

        -- Call linter when saving the file
        -- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        --     callback = function()
        --         lint.try_lint()
        --     end,
        -- })

    end,
}
