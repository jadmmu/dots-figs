return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },

  config = function()
    ------------------------------------------------------------------
    -- AUTO-OPEN NEO-TREE (DASHBOARD SAFE, FILE SAFE)
    ------------------------------------------------------------------
    local function open_neotree_if_needed()
      -- If dashboard (no args), do nothing
      if vim.fn.argc() == 0 then
        return
      end

      -- Open Neo-tree only once
      if vim.g.neotree_opened then
        return
      end

      vim.g.neotree_opened = true
      vim.cmd("Neotree show")
    end

    -- When opening a project (nvim .)
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = open_neotree_if_needed,
    })

    -- When opening a single file (nvim file.cpp)
    vim.api.nvim_create_autocmd("BufReadPost", {
      once = true,
      callback = open_neotree_if_needed,
    })

    ------------------------------------------------------------------
    -- KEYBIND
    ------------------------------------------------------------------
    vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", {
      desc = "Toggle file explorer",
    })

    ------------------------------------------------------------------
    -- NEO-TREE SETUP (VS CODE STYLE)
    ------------------------------------------------------------------
    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "rounded",

      enable_git_status = true,
      enable_diagnostics = true,

      window = {
        position = "left",
        width = 30,
      },

      filesystem = {
        follow_current_file = {
          enabled = true,
        },
        hijack_netrw_behavior = "open_default",
        use_libuv_file_watcher = true,
      },

      default_component_configs = {
        indent = {
          indent_size = 2,
          padding = 1,
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
        },
      },
    })
  end,
}
