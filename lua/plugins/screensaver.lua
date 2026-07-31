return {
  "Root-lee/screensaver.nvim",
  event = "VeryLazy",
  config = function()
    require("screensaver").setup({
      idle_ms = 180 * 1000, -- Idle time in milliseconds (5 minute)
      animations = {
          "matrix",
          -- "rain",
          -- "game_of_life",
          -- "move_left",
          -- "move_right",
          "scramble",
          -- "random_case",
          -- "bounce",
          "starfield",
          -- "pipes",
          -- "fire",
          -- "snow",
          -- "zoo",
        },
    })
  end,
}
