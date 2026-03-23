return {
  "Root-lee/screensaver.nvim",
  config = function()
    require("screensaver").setup({
      idle_ms = 180 * 1000, -- Idle time in milliseconds (5 minute)
    })
  end,
}
