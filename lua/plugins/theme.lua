return {
  "EdenEast/nightfox.nvim",
  priority = 1000,
  config = function()
    require("nightfox").setup({
      options = {
        transparent = false,
        styles = {
          comments = "italic",
          keywords = "bold",
          functions = "NONE",
          strings = "NONE",
          variables = "NONE",
        },
      },
      palettes = {
        nightfox = {
          bg0 = "#0b0e14",
          bg1 = "#0f131c",
          fg0 = "#cdd6f4",

          purple = "#8b5cf6",   -- cursed purple
          cyan = "#2dd4bf",     -- mahito teal
          pink = "#ec4899",
          red = "#ef4444",
          green = "#22c55e",
        },
      },
    })

    vim.cmd("colorscheme nightfox")
  end,
}
