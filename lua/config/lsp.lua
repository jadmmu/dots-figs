require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "clangd",
    "gopls",
    "rust_analyzer",
    "pyright",
    "bashls",
    "lua_ls",
    "hls",
  },
  automatic_installation = true,
})


local capabilities = require("cmp_nvim_lsp").default_capabilities()


vim.lsp.config("clangd", {
  cmd = { "clangd", "--background-index" },
  capabilities = capabilities,
})

vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})


local default_servers = { "gopls", "rust_analyzer", "pyright", "bashls", "hls" }
for _, server in ipairs(default_servers) do
  vim.lsp.config(server, { capabilities = capabilities })
end


vim.lsp.enable({
  "clangd",
  "gopls",
  "rust_analyzer",
  "pyright",
  "bashls",
  "lua_ls",
  "hls",
})