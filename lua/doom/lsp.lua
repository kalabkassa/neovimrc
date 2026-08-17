vim.lsp.config("vtsls", {
    cmd = { "vtsls", "--stdio" },

    filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
    },
})

vim.lsp.config("pyright", {
    cmd = { "pyright-langserver", "--stdio" },

    filetypes = {
        "python",
    },
})

vim.lsp.config("clangd", {
    cmd = { "clangd" },

    filetypes = {
        "c",
        "cpp",
        "objc",
        "objcpp",
    },

    init_options = {
        fallbackFlags = {
            "-std=c++23",
        },
    },
})

vim.lsp.config("bashls", {
    cmd = { "bash-language-server", "start" },

    filetypes = {
        "sh",
        "bash",
    },
})

vim.lsp.enable("bashls")
vim.lsp.enable("vtsls")
vim.lsp.enable("clangd")
vim.lsp.enable("pyright")

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local opts = { buffer = args.buf }

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    end,
})
