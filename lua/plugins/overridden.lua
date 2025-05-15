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
    "max397574/better-escape.nvim",
    opts = function(_, opts)
      opts.default_mappings = false
      opts.mappings = {
        i = {
          f = {
            d = "<Esc>",
          },
        },
        t = {
          f = {
            d = "<Esc>",
          },
        },
      }
    end,
  },
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.explorer = { enabled = true }
      opts.lazygit = { enabled = true }
      opts.picker = {
        enabled = true,
        sources = {
          explorer = {
            enabled = true,
            hidden = true,
            auto_close = false,
            win = {
              list = {
                keys = {
                  ["o"] = { { "pick_win", "jump" }, mode = { "n", "i" } },
                },
              },
            },
          },
        },
      }
    end,
  },
}
