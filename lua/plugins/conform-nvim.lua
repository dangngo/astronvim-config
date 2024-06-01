return {
  "stevearc/conform.nvim",
  opts = {
    python = { "isort", "black" },
    go = { "goimports", "gofumpt" },
    tf = { "terraform_fmt" },
    terraform = { "terraform_fmt" },
    ["terraform-vars"] = { "terraform_fmt" },
  },
}
