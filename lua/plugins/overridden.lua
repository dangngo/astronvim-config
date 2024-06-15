return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.sources = { "filesystem" }
      opts.filesystem.filtered_items.visible = true
      opts.filesystem.filtered_items.never_show = {
        ".git",
        ".DS_Store",
      }
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      opts.pickers = {
        colorscheme = {
          enable_preview = true,
        },
        find_files = {
          theme = "ivy",
          hidden = true,
        },
        buffers = {
          theme = "ivy",
        },
        live_grep = {
          theme = "ivy",
        },
        current_buffer_fuzzy_find = {
          theme = "ivy",
        },
        oldfiles = {
          theme = "ivy",
        },
        registers = {
          theme = "cursor",
        },
      }
    end,
  },
}
