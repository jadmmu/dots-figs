return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },

  config = function()
    local dashboard = require("dashboard")


    local function new_cpp_project()
      local name = vim.fn.input("Project name: ")
      if name == "" then
        return
      end

      local root = vim.fn.getcwd() .. "/" .. name
      vim.fn.mkdir(root .. "/src", "p")

    
      local main = io.open(root .. "/src/main.cpp", "w")
      main:write([[
#include <iostream>

int main() {
    std::cout << "Hello from ]] .. name .. [[" << std::endl;
    return 0;
}
]])
      main:close()

     
      local cmake = io.open(root .. "/CMakeLists.txt", "w")
      cmake:write([[
cmake_minimum_required(VERSION 3.20)
project(]] .. name .. [[ LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(]] .. name .. [[
    src/main.cpp
)
]])
      cmake:close()

    
      vim.cmd("cd " .. root)
      vim.cmd("edit src/main.cpp")
    end


    dashboard.setup({
      theme = "doom",
      config = {


        header = {
          "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠻⣿⣿⣿⠟⠛⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
          "⣿⣿⣿⣿⣿⣿⣿⣾⣿⣿⣿⣟⣿⡿⢀⣾⣷⢠⢿⡇⣰⣿⣷⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
          "⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⠃⢸⣿⣿⠂⣿⠀⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
          "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⢹⣿⣿⠁⣿⠀⣿⣿⡇⠸⣿⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
          "⣿⣿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⢸⣿⣿⡀⢿⠀⣿⣿⡇⠀⣿⣿⣿⣿⣿⣿⣿⣾⣿⣿⢿⣻⣿⣿⣿⣿",
          "⣿⣿⣿⣿⣻⣿⣿⣿⣿⣿⣿⣽⣿⠗⠄⠛⢛⣃⣈⣀⣍⣩⣁⣈⣉⣁⡛⠙⠻⢿⢿⣿⣿⣿⣿⣿⣿⢿⣿⣿",
          "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠛⣃⣥⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣤⣉⠛⣿⣿⣿⣿⣿⣿⣿",
          "⣿⣿⣿⣿⣿⣿⣿⠿⢁⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣌⠻⢿⣿⣿⣿⣿",
          "⣿⣿⣿⣿⣿⡿⠃⣴⣿⣿⣿⣿⣿⡿⠋⢹⣿⣿⣿⣿⣿⣿⡇⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠈⢿⣿⣿⣿",
          "⣿⣿⣿⣿⣿⠉⣾⣿⣿⣿⡿⠟⢁⣴⣾⡎⣿⣿⣿⣿⣿⣿⢃⣿⣶⡌⠉⠟⣿⣿⣿⣿⣿⣿⣿⣧⠐⣿⣿⣿",
          "⣿⣿⣾⣿⠁⣼⣿⣿⣿⣿⠇⣴⣿⣿⣿⣿⡘⡇⢸⣿⣿⡏⣼⣿⣿⣿⣼⣦⢹⣿⣿⣿⣿⣿⣿⣿⡆⢋⣿⣿",
          "⣿⣿⣿⠓⢰⣿⣿⣿⣿⣿⡂⣿⣿⠟⣉⠙⢧⠁⡇⠇⠏⡼⢋⡛⢿⣿⣿⣿⢼⣿⣿⣿⣿⣿⣿⣿⣿⡀⣽⣿",
          "⣿⣿⣿⠇⠂⢸⣿⣿⣿⠸⡄⣿⣿⣆⣀⣀⣾⣆⡃⢀⣾⣇⠀⢀⣸⣿⢿⠇⣾⢹⣿⣿⣿⣿⣿⣿⣿⠃⠈⣿",
          "⣿⣿⣿⡤⡷⢀⢿⡿⢿⠀⠇⣠⣈⣸⣿⣿⡟⢿⠉⣾⡗⢻⣿⣯⣿⣃⡆⡄⠏⡀⣿⢿⡹⡿⠸⣿⣿⢸⣤⣌",
          "⢟⣿⣿⣿⣧⠌⡌⢿⡘⢸⣄⠸⣿⣿⣿⣿⣷⡂⠀⢀⣴⣿⣿⣿⣿⣿⡿⢨⣾⢡⡟⡸⢰⢣⢃⡇⣿⠈⢿⣿",
          "⣇⢠⠛⣁⡥⠀⣻⣌⠃⠘⠻⡆⣋⣉⡛⡛⠿⣑⠈⠂⣿⣿⣿⣿⣿⣿⣵⣿⡿⠘⣰⡏⣠⠟⠸⢰⣿⡄⢹⣿",
          "⣿⣿⡇⠱⡄⢀⣿⣿⡇⣼⢀⣶⣆⣠⣶⡆⣀⣉⠀⠀⠈⡛⡛⢿⣿⣿⣿⣿⣃⣼⡿⣰⣥⠀⢠⣿⣿⣷⠀⣜",
          "⣿⣿⣿⣶⠈⢸⣿⣿⣿⣿⣌⠻⠿⠛⣉⣤⢨⣤⠔⣀⣢⢬⠀⠟⠛⢛⣋⣴⣿⣿⣷⣿⣧⣾⡌⣿⣿⣿⡇⢸",
          "⠿⣿⣿⣿⡇⢸⣿⣿⣿⣿⣿⣷⠘⣿⣿⣿⠈⢠⠩⠉⣿⡇⠐⢿⣿⣿⠿⢛⣿⣿⣿⣿⣿⣿⡇⢸⣿⣿⠇⣰",
          "⣯⡾⡿⣿⣧⡘⠛⠻⠛⠻⠟⣡⠀⣿⣿⣿⣆⡓⠤⠾⠭⢃⣸⣶⣦⣴⣾⣿⣿⣿⣿⣿⣿⣿⡇⢈⡉⢡⢀⢘",
          "",
          "        ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗       ",
          "        ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║       ",
          "        ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║       ",
          "        ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║       ",
          "        ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║       ",
          "        ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝       ",
        },


     

center = {
  {
    icon = "󰱼  ",
    desc = "Find File",
    key = "f",
    action = "Telescope find_files",
  },
  {
    icon = "󰈚  ",
    desc = "Recent Files",
    key = "r",
    action = "Telescope oldfiles",
  },
  {
    icon = "󰗼  ",
    desc = "Quit",
    key = "q",
    action = "qa",
  },
},

        center = {
          {
            icon = "󰱼  ",
            desc = "Find File",
            key = "f",
            action = "Telescope find_files",
          },
          {
            icon = "󰈚  ",
            desc = "Recent Files",
            key = "r",
            action = "Telescope oldfiles",
          },
          {
            icon = "󰙅  ",
            desc = "New C++ Project",
            key = "n",
            action = new_cpp_project,
          },
          {
            icon = "󰗼  ",
            desc = "Quit",
            key = "q",
            action = "qa",
          },
        },


   
        footer = {
          "Jad / squallstrings",
        },
      },
    })
  end,
}
