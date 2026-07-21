return {
    "ergodice/hamal.nvim",
    event = "VeryLazy",
    config = function()
        local hamal = require("hamal")
        -- keymaps
        vim.keymap.set("n", "<leader>jj", hamal.split,{desc = "hamal"})
        vim.keymap.set("o", "<leader>jj", hamal.split,{desc = "hamal"}) -- To use hamal mode in the o-pending mode.
        -- you can also use hamal in visual mode
        -- vim.keymap.set("v", "<leader><leader>", hamal.split)
        -- You must call hamal.setup() at least once.
        hamal.setup({
          highlights = {
              border = {
                  {
                      -- you have to set both, top and bottom
                      top = { "HamalFirstBorderTop",  { link = "ColorColumn" } },
                      bottom = { "HamalFirstBorderBottom",  { link = "Search" } },
                  },
                  { "HamalSecondBorder", {} },
              }
          },
          quit_on_unmapped_keys  = true,
        })
    end,
}
