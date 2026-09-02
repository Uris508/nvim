return
{
  "mistricky/codesnap.nvim",
   event = "VeryLazy",
  -- build = "make",
  keys = {
    { "<leader>cp", "ggVG:<C-u>'<,'>CodeSnap<CR>", mode = "n", desc = "Copy code snapshot" },
    { "<leader>cp", ":'<,'>CodeSnap<cr>", mode = "x", desc = "Copy code snapshot" },
    { "<leader>cP", "ggVG:<C-u>'<,'>CodeSnapHighlight<cr>", mode = "n", desc = "Copy code snapshot Hightlight" },
    { "<leader>cP", ":'<,'>CodeSnapHighlight<cr>", mode = "x", desc = "Copy code snapshot Hightlight" },
  },
  opts = {
    snapshot_config = {
      themes_folders = {
        "~/AppData/Local/nvim/themes/",
      },
      theme = "catppuccin",

      window = {
        mac_window_bar = true,
        shadow = {
          radius = 20,
          color = "#00000040",
        },
        margin = {
          x = 0,
          y = 0,
        },
      },
      code_config = {
        font_family = "CaskaydiaCove Nerd Font",
        -- font_family = "IosevkaTerm Nerd Font",
      },
    },
  }
}
