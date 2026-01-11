return {
  "EdenEast/nightfox.nvim",
  priority = 1000,

  config = function()
    require("nightfox").setup({
      options = {
        transparent = true,
        terminal_colors = true,
        dim_inactive = false,
        styles = {
          comments = "italic",
          keywords = "bold",
          types = "italic,bold",
        },
      },

      palettes = {
        carbonfox = {
          bg0 = "#000000",
        },
      },

      groups = {
        carbonfox = {
  
          Normal = { bg = "NONE" },
          NormalNC = { bg = "NONE" },
          NormalFloat = { bg = "NONE" },
          FloatBorder = { fg = "#7dcfff", bg = "NONE" },


          NeoTreeNormal = { bg = "NONE" },
          NeoTreeNormalNC = { bg = "NONE" },


          DashboardHeader = { fg = "#7dcfff" },
          DashboardCenter = { fg = "#c0caf5" },
          DashboardFooter = { fg = "#565f89" },

 
          TelescopeNormal = { bg = "NONE" },
          TelescopeBorder = { fg = "#7dcfff", bg = "NONE" },

      
          DiagnosticError = { fg = "#db4b4b" },
          DiagnosticWarn  = { fg = "#e0af68" },
          DiagnosticInfo  = { fg = "#7dcfff" },

   
          CursorLine = { bg = "#111111" },
          Visual = { bg = "#1a1a1a" },
        },
      },
    })

    vim.cmd("colorscheme carbonfox")
  end,
}
