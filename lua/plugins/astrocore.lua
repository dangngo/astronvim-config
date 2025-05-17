-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

local _clipboard = {}
local _ok, _ = pcall(require, "vim.ui.clipboard.osc52")
if _ok then
  _clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy "+",
      ["*"] = require("vim.ui.clipboard.osc52").copy "*",
    },
    paste = {
      ["+"] = require("vim.ui.clipboard.osc52").paste "+",
      ["*"] = require("vim.ui.clipboard.osc52").paste "*",
    },
  }
else
  _clipboard = {}
end

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
        clipboard = "unnamedplus",
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
        clipboard = _clipboard,
      },
    },
    -- Mappings can be configured through AstroCore as well.
    mappings = {
      n = {
        -- CORE
        ["<Leader>w"] = { "<cmd>confirm qall<cr>", desc = "Quit" },
        ["<leader>e"] = { function() require("snacks").explorer() end, desc = "File Explorer" },

        -- Buffers
        ["<Tab>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["<S-Tab>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        ["<Leader><Tab>"] = { function() require("snacks").picker.buffers() end, desc = "Buffers list" },
        ["<Leader>q"] = { function() require("astrocore.buffer").close() end, desc = "Close buffer" },
        ["<leader>bd"] = { function() require("snacks").bufdelete() end, desc = "Delete Buffer" },

        -- Files
        ["<leader><space>"] = { function() require("snacks").picker.files() end, desc = "Find Files" },
        ["<Leader>ff"] = { function() require("snacks").picker.lines() end, desc = "Find lines in buffer" },
        ["<Leader>fs"] = { function() require("snacks").picker.smart() end, desc = "Find buffers/recent/files" },
        ["<Leader>fF"] = {
          function() require("snacks").picker.files { hidden = true, ignored = true } end,
          desc = "Find all files",
        },
        ["<leader>fg"] = { function() require("snacks").picker.git_files() end, desc = "Find Git Files" },
        ["<leader>fp"] = { function() require("snacks").picker.projects() end, desc = "Projects" },
        ["<leader>fr"] = { function() require("snacks").picker.recent() end, desc = "Recent" },

        -- Grep
        ["<Leader>/"] = { function() require("snacks").picker.grep() end, desc = "Grep" },
        ["<Leader>fb"] = { function() require("snacks").picker.grep_buffers() end, desc = "Grep open buffers" },
        ["<Leader>fc"] = { function() require("snacks").picker.grep_word() end, desc = "Find word under cursor" },
        ["<Leader>fw"] = {
          function() require("snacks").picker.grep { hidden = true, ignored = true } end,
          desc = "Grep all files",
        },

        -- LSP
        ["<leader>lR"] = {
          function() require("snacks").picker.lsp_references() end,
          desc = "References",
        },
        ["gI"] = { function() require("snacks").picker.lsp_implementations() end, desc = "Goto Implementation" },

        -- Search
        ["<leader>f<CR>"] = { function() require("snacks").picker.resume() end, desc = "Resume" },
        ["<Leader>fk"] = { function() require("snacks").picker.keymaps() end, desc = "Find keymaps" },
        ["<leader>fn"] = { function() require("snacks").picker.notifications() end, desc = "Notification History" },
        ["<Leader>f'"] = { function() require("snacks").picker.marks() end, desc = "Find marks" },
        ["<Leader>fu"] = { function() require("snacks").picker.undo() end, desc = "Find undo history" },
        ["<leader>f:"] = { function() require("snacks").picker.command_history() end, desc = "Command History" },
        ['<leader>f"'] = { function() require("snacks").picker.registers() end, desc = "Registers" },
        ["<leader>fq"] = { function() require("snacks").picker.qflist() end, desc = "Quickfix lists" },

        -- Terminal
        ["<C-\\>"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "Toggleterm" },

        -- Git
        ["<leader>gg"] = { function() require("snacks").lazygit.open() end, desc = "Lazygit" },

        -- Disable idiot mappings
        ["<Leader>c"] = false,
        ["|"] = false,
        ["\\"] = false,
        ["s"] = false,
      },
      v = {
        ["<Leader>fc"] = { function() require("snacks").picker.grep_word() end, desc = "Find word under cursor" },
      },
      t = {
        ["<C-\\>"] = { "<cmd>ToggleTerm <cr>", desc = "Toggleterm" },
        ["<C-J>"] = false,
        ["<C-K>"] = false,
        ["<C-L>"] = false,
        ["<C-H>"] = false,
      },
    },
  },
}
