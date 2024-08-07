-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- import/override with your plugins folder
  { import = "astrocommunity.recipes.telescope-lsp-mappings" },

  -- language packs
  { import = "astrocommunity.pack.lua" },

  -- motions
  { import = "astrocommunity.motion.mini-surround" },
  -- { import = "astrocommunity.motion.flash-nvim" },

  -- themes
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.nightfox-nvim" },
  { import = "astrocommunity.colorscheme.kanagawa-nvim" },
}
