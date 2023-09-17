return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local mason = require("mason")
            local mason_lspconfig = require("mason-lspconfig")

            -- enable mason and configure icons
            mason.setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })

            -- list of servers for mason to install
            mason_lspconfig.setup({
                ensure_installed = {
                    -- "debugpy", -- DAP - Python
                    "tsserver",
                    "html",
                    "cssls",
                    "tailwindcss",
                    "svelte",
                    "lua_ls",
                    "graphql",
                    "emmet_ls",
                    "prismals",
                    "pyright", -- python
                    "clangd", -- C, C++, etc.
                },
                -- auto-install configured servers (with lspconfig)
                -- automatic_installation = true, -- not the same as ensure_installed
            })
        end,
    }
}
