-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

vim.api.nvim_create_autocmd(
  { "BufEnter" },
  { pattern = { "*" }, callback = function() vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" } end }
)

vim.filetype.add {
  pattern = {
    [".*/charts/[^/]+/templates/.*%.yaml"] = "helm",
  },
}

vim.api.nvim_create_autocmd({ "TermOpen" }, {
  pattern = { "term://*" },
  callback = function()
    local opts = { noremap = true }
    vim.api.nvim_buf_set_keymap(0, "t", "fd", [[<C-\><C-n>]], opts)
  end,
})
