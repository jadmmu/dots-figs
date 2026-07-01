local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
    return
end

configs.setup({
    ensure_installed = {
        "c",
        "cpp",
        "go",
        "rust",
        "python",
        "bash",
        "lua",
        "haskell",
    },

    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },


    indent = {
        enable = false,
    },
})
