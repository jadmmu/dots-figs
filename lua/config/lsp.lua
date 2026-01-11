local lspconfig = require("lspconfig")


lspconfig.clangd.setup({
  cmd = { "clangd", "--background-index" },
})


lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})
