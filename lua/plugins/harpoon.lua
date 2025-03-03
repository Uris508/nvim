return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
      settings = {
        save_on_toggle = true,
      },
    },
    keys = function()
      local keys = {
        {
          -- "<leader>a",
          "<S-l>",
          function()
            vim.cmd('set noshellslash')
            require("harpoon"):list():add()
          end,
          desc = "Harpoon File",
        },
        {
          -- "<leader>h",
          "<S-h>",
          function()
            local harpoon = require("harpoon")
            local width = vim.api.nvim_win_get_width(0) - 4,
            vim.cmd('set noshellslash')
            harpoon.ui:toggle_quick_menu(harpoon:list())
            vim.api.nvim_win_set_width(0,width)
          end,
          desc = "Harpoon Quick Menu",
        },
      }

      -- for i = 1, 5 do
      --   table.insert(keys, {
      --     "<leader>" .. i,
      --     function()
      --       require("harpoon"):list():select(i)
      --     end,
      --     desc = "Harpoon to File " .. i,
      --   })
      -- end
      return keys
    end,
  }
}
