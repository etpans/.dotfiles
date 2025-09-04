return {
    -- LSP support
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            -- Mason (LSP/DAP/Linter/Formatter installer)
            { "mason-org/mason.nvim", config = true },
            "mason-org/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",

            -- Useful LSP status updates
            {
                "j-hui/fidget.nvim",
                opts = {
                    notification = {
                        window = {
                            winblend = 0,
                        },
                    },
                },
            },

            -- Completion framework
            {
                "hrsh7th/nvim-cmp",
                event = "InsertEnter",
                dependencies = {
                    "hrsh7th/cmp-nvim-lsp",
                    "hrsh7th/cmp-buffer",
                    "hrsh7th/cmp-path",
                    "hrsh7th/cmp-cmdline",
                    "L3MON4D3/LuaSnip", -- optional, for snippets
                },
                config = function()
                    local cmp = require("cmp")
                    cmp.setup({
                        mapping = cmp.mapping.preset.insert({
                            ["<C-Space>"] = cmp.mapping.complete(),
                            ["<CR>"] = cmp.mapping.confirm({ select = true }),
                            ["<C-l>"] = cmp.mapping.confirm({ select = true }),
                            ["<C-e>"] = cmp.mapping.abort(),
                        }),
                        sources = cmp.config.sources({
                            { name = "nvim_lsp" },
                            { name = "buffer" },
                            { name = "path" },
                        }),
                    })
                end,
            },
        },

        config = function()
            -- Autocmd for LSP-related keymaps
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
                callback = function(event)
                    local map = function(keys, func, desc)
                        vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                    end

                    map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
                    map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
                    map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
                    map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
                    map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
                    map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
                    map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
                    map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
                    map("K", vim.lsp.buf.hover, "Hover Documentation")
                    map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

                    map("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
                    map("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
                    map("<leader>wl", function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, "[W]orkspace [L]ist Folders")

                    -- Highlight references on CursorHold
                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
                        local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
                        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.document_highlight,
                        })
                        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.clear_references,
                        })
                        vim.api.nvim_create_autocmd("LspDetach", {
                            group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
                            callback = function(event2)
                                vim.lsp.buf.clear_references()
                                vim.api.nvim_clear_autocmds { group = "lsp-highlight", buffer = event2.buf }
                            end,
                        })
                    end

                    -- Toggle inlay hints
                    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
                        map("<leader>th", function()
                            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
                        end, "[T]oggle Inlay [H]ints")
                    end
                end,
            })

            -- Capabilities (with cmp)
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

            -- Define servers
            local servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            completion = { callSnippet = "Replace" },
                            runtime = { version = "LuaJIT" },
                            workspace = {
                                checkThirdParty = false,
                                library = vim.api.nvim_get_runtime_file("", true),
                            },
                            diagnostics = {
                                globals = { "vim" },
                                disable = { "missing-fields" },
                            },
                            format = { enable = false },
                        },
                    },
                },
                pylsp = {
                    settings = {
                        pylsp = {
                            plugins = {
                                pyflakes = { enabled = false },
                                pycodestyle = { enabled = false },
                                autopep8 = { enabled = false },
                                yapf = { enabled = false },
                                mccabe = { enabled = false },
                                pylsp_mypy = { enabled = false },
                                pylsp_black = { enabled = false },
                                pylsp_isort = { enabled = false },
                            },
                        },
                    },
                },
                jsonls = {},
                yamlls = {},
                bashls = {},
                tailwindcss = {},
                html = { filetypes = { "html", "twig", "hbs" } },
            }

            -- Ensure installed
            local ensure_installed = vim.tbl_keys(servers or {})
            vim.list_extend(ensure_installed, {
                "stylua", -- Lua formatter
                "prettier",
            })
            require("mason-tool-installer").setup { ensure_installed = ensure_installed }

            -- Setup each server
            for server, cfg in pairs(servers) do
                cfg.capabilities = vim.tbl_deep_extend("force", {}, capabilities, cfg.capabilities or {})
                vim.lsp.config(server, cfg)
                vim.lsp.enable(server)
            end
        end,
    },
}

