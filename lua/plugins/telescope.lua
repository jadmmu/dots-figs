return {
  "nvim-telescope/telescope.nvim",
  lazy = false, -- 🚨 FORCE LOAD AT STARTUP
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup({})
  end,
}
