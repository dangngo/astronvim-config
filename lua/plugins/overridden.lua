return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.sources = { "filesystem" }
    opts.filesystem.filtered_items.visible = true
  end,
}
