return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",

    config = function()
        require("nvim-treesitter").setup()

        require("nvim-treesitter").install({
            "javascript",
            "python",
            "cpp",
            "c",
        })

        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                pcall(vim.treesitter.start, args.buf)
            end,
        })
    end,
}
