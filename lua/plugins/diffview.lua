return {
  "sindrets/diffview.nvim",
   event = "VeryLazy",

    config = function ()
      require("diffview").setup({
        hooks = {
          -- 在進入 diff 視窗時自動展開所有摺疊
          diff_buf_read = function(bufnr)
            vim.opt_local.foldlevel = 99
          end,
        },
      })
    end
}
