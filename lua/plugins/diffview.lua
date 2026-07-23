return {
  "sindrets/diffview.nvim",
   event = "VeryLazy",

    config = function ()
      local actions = require("diffview.actions")
      require("diffview").setup({
        keymaps = {
          file_panel = {
            { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" } },
            { "n", "<c-k>",          actions.scroll_view(-0.25),             { desc = "Scroll the view up" } },
            { "n", "<c-j>",          actions.scroll_view(0.25),              { desc = "Scroll the view down" } },
            -- 使用 pcall 忽略 ]c / [c 到頭/到尾時的報錯
            {
              "n",
              "]c",
              function()
                vim.cmd("wincmd l")
                pcall(vim.cmd, "normal! ]c")
                vim.cmd("wincmd h")
              end,
              { desc = "next diff" },
            },
            {
              "n",
              "[c",
              function()
                vim.cmd("wincmd l")
                pcall(vim.cmd, "normal! [c")
                vim.cmd("wincmd h")
              end,
              { desc = "previous diff" },
            },
          },
          file_history_panel  = {
            { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" } },
            -- 使用 pcall 忽略 ]c / [c 到頭/到尾時的報錯
            {
              "n",
              "]c",
              function()
                vim.cmd("wincmd k")
                pcall(vim.cmd, "normal! ]c")
                vim.cmd("wincmd j")
              end,
              { desc = "next diff" },
            },
            {
              "n",
              "[c",
              function()
                vim.cmd("wincmd k")
                pcall(vim.cmd, "normal! [c")
                vim.cmd("wincmd j")
              end,
              { desc = "previous diff" },
            },
          },
        },
        hooks = {
          -- 在進入 diff 視窗時自動展開所有摺疊
          diff_buf_win_enter = function(bufnr, winid, ctx)
            vim.opt_local.foldenable = false
          end,
        },
      })
    end
}
