vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.timeout = true
vim.o.timeoutlen = 300


vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>", {
    desc = "Clear search highlight",
})




vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", {
    desc = "Toggle file explorer",
})

vim.keymap.set("n", "<leader>ef", "<cmd>Neotree focus<cr>", {
    desc = "Focus file explorer",
})




vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", {
    desc = "Find files",
})

vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", {
    desc = "Live grep",
})

vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", {
    desc = "Find buffers",
})

vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", {
    desc = "Help tags",
})




vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
    desc = "Go to definition",
})

vim.keymap.set("n", "gr", vim.lsp.buf.references, {
    desc = "Find references",
})

vim.keymap.set("n", "K", vim.lsp.buf.hover, {
    desc = "Hover documentation",
})

vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, {
    desc = "Rename symbol",
})

vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, {
    desc = "Code action",
})




vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {
    desc = "Previous diagnostic",
})

vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {
    desc = "Next diagnostic",
})

vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, {
    desc = "Line diagnostics",
})




vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<cr>", {
    desc = "Toggle terminal",
})



vim.keymap.set("n", "<C-h>", "<C-w>h", {
    desc = "Move to left window",
})

vim.keymap.set("n", "<C-l>", "<C-w>l", {
    desc = "Move to right window",
})

vim.keymap.set("n", "<C-j>", "<C-w>j", {
    desc = "Move to lower window",
})

vim.keymap.set("n", "<C-k>", "<C-w>k", {
    desc = "Move to upper window",
})
