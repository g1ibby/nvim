return {
  "GR3YH4TT3R93/zellij-nav.nvim",
  -- Only load plugin if in active Zellij instance
  -- Zellij sets ZELLIJ="0" when launching the editor
  cond = function()
    return vim.env.ZELLIJ == "0"
  end,
  -- Lazy load plugin for improved startup times
  event = "VeryLazy",
  init = function()
    -- Disable default keymaps provided by the plugin
    vim.g.zellij_nav_default_mappings = false -- Default: true
  end,
  -- opts is empty as we configure via init and keys here,
  -- but you could add plugin-specific options if needed.
  opts = {},
  -- Define custom keymaps using the lazy.nvim format
  keys = {
    -- Navigation Mappings using Alt + Arrow Keys
    { "<A-Left>", "<Cmd>ZellijNavigateLeft<CR>", desc = "Zellij: Navigate Left", silent = true },
    { "<A-Right>", "<Cmd>ZellijNavigateRight<CR>", desc = "Zellij: Navigate Right", silent = true },
    { "<A-Up>", "<Cmd>ZellijNavigateUp<CR>", desc = "Zellij: Navigate Up", silent = true },
    { "<A-Down>", "<Cmd>ZellijNavigateDown<CR>", desc = "Zellij: Navigate Down", silent = true },

    -- Pane Management Mappings
    { "<A-f>", "<Cmd>ZellijNewPane<CR>", desc = "Zellij: New Floating Pane", silent = true },
    { "<A-s>", "<Cmd>ZellijNewPaneSplit<CR>", desc = "Zellij: New Pane Below", silent = true },
    { "<A-v>", "<Cmd>ZellijNewPaneVSplit<CR>", desc = "Zellij: New Pane Right", silent = true },

    -- Tab Management Mappings
    { "<A-t>", "<Cmd>ZellijNewTab<CR>", desc = "Zellij: New Tab", silent = true },
  },
}
