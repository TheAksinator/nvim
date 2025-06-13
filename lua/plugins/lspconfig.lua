return {
    "neovim/nvim-lspconfig",
    config = function()
        local on_attach = function(client, bufnr)
            local opts = { noremap = true, silent = true }
            keybinds = {
                { 
                    "K", 
                    "vim.lsp.buf.hover()", 
                    desc = "Hover" 
                },
                { 
                    "gd", 
                    "vim.lsp.buf.definition()", 
                    desc = "Go To Definition" 
                },
                { 
                    "gD", 
                    "vim.lsp.buf.declaration()", 
                    desc = "Go To Declaration" 
                },
                { 
                    "gi", 
                    "vim.lsp.buf.implementation()", 
                    desc = "Go To Implementation" 
                },
                { 
                    "go", 
                    "vim.lsp.buf.type_definition()", 
                    desc = "Go To Type Definition" 
                },
                { 
                    "gr", 
                    "vim.lsp.buf.references()", 
                    desc = "Show References" 
                },
                { 
                    "gs", 
                    "vim.lsp.buf.signature_help()", 
                    desc = "Signature Help" 
                },
                { 
                    "<F2>", 
                    "vim.lsp.buf.rename()", 
                    desc = "LSP Rename" 
                },
                { 
                    "<F3>", 
                    "vim.lsp.buf.format({ async = true})", 
                    desc = "LSP Format", mode = { "n", "x" } 
                },
                { 
                    "<F4>", 
                    "vim.lsp.buf.code_action()", 
                    desc = "LSP Code Action" 
                }
            }

            for _, keybind in ipairs(keybinds) do
                local action = string.format("<cmd>lua %s<cr>", tostring(keybind[2]))
                vim.notify(action, "info")
                vim.api.nvim_buf_set_keymap(bufnr, 'n', keybind[1], action, { desc=keybind["desc"] })
            end
        end
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local lspconfig = require("lspconfig")
        lspconfig.pylsp.setup {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                pylsp = {
                    plugins = {
                        pycodestyle = {
                            ignore = {"W391"},
                                maxLineLength = 100
                        }
                    }
                }
            }
        }
        lspconfig.clangd.setup {}
    end,

}
