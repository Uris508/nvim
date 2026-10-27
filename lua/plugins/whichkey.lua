return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- 1. 觸發 WhichKey 彈出視窗的延遲時間（單位：毫秒）
    delay = 100, 

    -- 2. 視窗預設風格（可選: "classic", "modern", "helix"）
    preset = "helix",

    -- 3. 觸發模式與條件設定
    plugins = {
      marks = true,     -- 顯示 mark (例如 'a)
      registers = true, -- 顯示 暫存器 (例如 "a)
      spelling = {
        enabled = true, -- 拼字檢查提示
        suggestions = 20,
      },
    },

    -- 4. 視窗外觀自訂
    win = {
      border = "rounded", -- 視窗邊框: "none", "single", "double", "rounded"
      padding = { 1, 2 }, -- 內距 [上下, 左右]
      title = true,
      title_pos = "center",
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)

    -- 5. 全局設定 keymap 等待時間 (預設 1000ms 通常太慢，建議改為 300ms 左右)
    vim.opt.timeoutlen = 200

    -- 6. 註冊自訂 Leader 鍵群組標籤 (WhichKey v3 語法)
    -- wk.add({
    --   { "<leader>f", group = "File / Find" },
    --   { "<leader>b", group = "Buffers" },
    --   { "<leader>g", group = "Git" },
    --   { "<leader>q", "<cmd>qa<cr>", desc = "Quit Neovim" },
    --   { "<leader>w", "<cmd>w<cr>", desc = "Save File" },
    -- })
  end,
}
