local lspconfig = require("lspconfig")

-- C / C++
lspconfig.clangd.setup({
  cmd = { "clangd", "--background-index" },
})

-- Lua (for Neovim config itself)
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})
