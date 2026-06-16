return {
  "Hashino/hidecursor.nvim",
  cmd = "ToggleCursor",
  keys = {
    { "<leader>tc", function() require("hidecursor").toggle() end, desc = "[T]oggle [C]ursor", },
  },
}
