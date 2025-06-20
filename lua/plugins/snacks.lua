return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,

  opts = {
    picker = {
      layouts = {
        vertical = {
          layout = {
            backdrop = false,
            width = 0.95,
            min_width = 80,
            height = 0.9,
            min_height = 30,
            box = "vertical",
            border = "rounded",
            title = "{title} {live} {flags}",
            title_pos = "center",
            { win = "preview", title = "{preview}", height = 0.6, border = "none" },
            { win = "input", height = 1, border = "top" },
            { win = "list", border = "top" },
          },
        },
      },
      layout = {
        cycle = false,
        preset = "vertical",
      },
      formatters = {
          file = {
            truncate = 180,
          },
      },
    },
    dashboard = { ---@class snacks.dashboard.Config
      ---@field sections snacks.dashboard.Section
      ---@field formats table<string, snacks.dashboard.Text|fun(item:snacks.dashboard.Item, ctx:snacks.dashboard.Format.ctx):snacks.dashboard.Text>

      width = 60,
      row = nil, -- dashboard position. nil for center
      col = nil, -- dashboard position. nil for center
      pane_gap = 4, -- empty columns between vertical panes
      autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
      -- These settings are used by some built-in sections
      preset = {
        -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
        ---@type fun(cmd:string, opts:table)|nil
        pick = nil,
        -- Used by the `keys` section to show keymaps.
        -- Set your curstom keymaps here.
        -- When using a function, the `items` argument are the default keymaps.
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        -- Used by the `header` section
        header = [[
   ___  ___  ________  ___  ________  ___      ___ ___  _____ ______  
  |\  \|\  \|\   __  \|\  \|\   ____\|\  \    /  /|\  \|\   _ \  _   \    
  \ \  \\\  \ \  \|\  \ \  \ \  \___|\ \  \  /  / | \  \ \  \\\__\ \  \   
   \ \  \\\  \ \   _  _\ \  \ \_____  \ \  \/  / / \ \  \ \  \\|__| \  \  
    \ \  \\\  \ \  \\  \\ \  \|____|\  \ \    / /   \ \  \ \  \    \ \  \ 
     \ \_______\ \__\\ _\\ \__\____\_\  \ \__/ /     \ \__\ \__\    \ \__\
      \|_______|\|__|\|__|\|__|\_________\|__|/       \|__|\|__|     \|__|
                             \|_________|                                
        ]],
      },
      sections = {
        {
          -- pane = 2,
          section = "terminal",
          -- cmd = "chafa c:/logo/angry_trump.jpg --format symbols --symbols vhalf --size 60x60",
          cmd = vim.g.uris_logo,
          height = 30,
          padding = 1,
        },
        {
          pane = 2,
          {section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          -- { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { section = "startup" },
        },
      },
    },
  },
}
