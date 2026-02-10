
require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "clangd",
    "gopls",
    "rust_analyzer",
    "pyright",
    "bashls",
    "lua_ls",
  },
  automatic_installation = true,
})


local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()


lspconfig.clangd.setup({
  cmd = { "clangd", "--background-index" },
  capabilities = capabilities,
})


lspconfig.gopls.setup({
  capabilities = capabilities,
})


lspconfig.rust_analyzer.setup({
  capabilities = capabilities,
})


lspconfig.pyright.setup({
  capabilities = capabilities,
})


lspconfig.bashls.setup({
  capabilities = capabilities,
})


lspconfig.lua_ls.setup({
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})
