-- Customize Treesitter

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    treesitter = {
      ensure_installed = {
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
      },
    },
  },
}
