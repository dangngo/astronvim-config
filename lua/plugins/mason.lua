-- Customize Mason plugins

---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "lua-language-server",
        "bash-language-server",
        "gopls",
        "pyright",
        "terraform-ls",
        "typescript-language-server",
        "shfmt",
        "shellcheck",
        -- go
        "gomodifytags",
        "gofumpt",
        "iferr",
        "impl",
        "goimports",
        "prettier",
        "stylua",
      })
    end,
  },
}
