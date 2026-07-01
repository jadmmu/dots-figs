return {
  "doki-theme/doki-theme-vim",
  name = "doki-theme",
  lazy = false, 
  priority = 1000, 
  config = function()
    
    vim.opt.termguicolors = true
    
    
    vim.opt.background = "dark"
    
    
    vim.cmd([[colorscheme cc]])
  end,
}

-- made because  I use catppuccin on windows and doki kept messing up and  not actually having proper themeing 