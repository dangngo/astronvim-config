-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        expandtab = true, -- use spaces instead of tabs
        foldenable = true, -- enable fold for nvim-ufo
        hidden = true, -- enable background buffers
        history = 100, -- remember n lines in history
        ignorecase = true, -- Case insensitive searching
        infercase = true, -- Infer cases in keyword completion
        lazyredraw = true, -- Faster scrolling
        linebreak = true, -- Wrap lines at 'breakat'
        mouse = "a", -- enable mouse support
        number = true, -- Show numberline
        numberwidth = 4, -- Set number column width to 2 (default 4)
        relativenumber = true, -- Show relative numberline
        spell = false, -- No spell checking
        scrolloff = 8, -- Number of lines to keep above and below the cursor
        shiftwidth = 4, -- Shift 4 spaces when tab
        showmatch = true, -- highlight matching parenthesis
        signcolumn = "auto", -- Sign column (auto/yes)
        smartcase = true, -- Case sensitivie searching
        smartindent = true, -- Smarter autoindentation
        splitbelow = true, -- Splitting a new window below the current one
        splitright = true, -- Splitting a new window at the right of the current one
        swapfile = false, -- Never use swapfile
        tabstop = 4, -- Number of space in a tab
        termguicolors = true, -- Enable 24-bit RGB color in the TUI
        timeoutlen = 500, -- Shorten key timeout length a little bit for which-key
        undofile = true, -- Enable persistent undo
        updatetime = 300, -- Length of time to wait before triggering the plugin
        showmode = true, -- Show current mode
        showtabline = 2, -- Always show tabs
        virtualedit = "block", -- allow going past end of line in visual block mode
        wrap = true, -- Enable wrapping of lines longer than the width of window
        writebackup = false, -- Disable making a backup before overwriting a file
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- This can be found in the `lua/lazy_setup.lua` file
        highlighturl_enabled = true, -- highlight URLs by default
        ui_notifications_enabled = true, -- disable notifications when toggling UI elements
      },
    },
    -- Mappings can be configured through AstroCore as well.
    mappings = {
      n = {
        -- CORE
        ["<Leader>w"] = { "<cmd>confirm qall<cr>", desc = "Quit" },
        ["<Leader><Leader>"] = {
          function() require("telescope.builtin").find_files { theme = "ivy" } end,
          desc = "Find files",
        },
        ["<Leader><Tab>"] = { "<cmd>Telescope buffers<cr>", desc = "Buffers list" },
        ["<C-\\>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggleterm" },

        -- Buffers
        ["<Leader>q"] = { function() require("astrocore.buffer").close() end, desc = "Close buffer" },
        ["<Tab>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["<S-Tab>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        ["<Leader>c"] = false,

        -- Telescope
        ["<Leader>ff"] = {
          function() require("telescope.builtin").current_buffer_fuzzy_find() end,
          desc = "Search current buffer",
        },
        ["<Leader>fr"] = { function() require("telescope.builtin").oldfiles() end, desc = "Recent files" },
        ["<Leader>fy"] = { function() require("telescope.builtin").registers() end, desc = "Find registers" },
        -- ["<Leader>/"] = { function() require("telescope.builtin").live_grep() end, desc = "Find words" },

        -- Disable idiot mappings
        ["|"] = false,
        ["\\"] = false,
        ["s"] = false,
      },
      t = {
        ["<C-\\>"] = { "<cmd>ToggleTerm <cr>", desc = "Toggleterm" },
        ["<C-j>"] = false,
        ["<C-k>"] = false,
        ["<C-l>"] = false,
        ["<C-h>"] = false,
      },
    },
  },
}
