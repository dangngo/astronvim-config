-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "bash",
      "cmake",
      "comment",
      "css",
      "dockerfile",
      "go",
      "gosum",
      "gomod",
      "gowork",
      "graphql",
      "hcl",
      "html",
      "http",
      "javascript",
      "jsdoc",
      "json",
      "lua",
      "make",
      "proto",
      "python",
      "regex",
      "ruby",
      "rust",
      "terraform",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "yaml",
    })
  end,
}
