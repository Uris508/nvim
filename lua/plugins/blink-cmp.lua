return {
  "Saghen/blink.cmp",
  opts = {
    enabled = function() return not vim.tbl_contains({ "typr" }, vim.bo.filetype) end,
  },
}
