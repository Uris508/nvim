return {
    {
      'stevearc/aerial.nvim',
      config = function()
        -- calling `setup` is optional for customization
        require("aerial").setup({
          layout = {
            default_direction = "prefer_left",
          },
      })
      end,
    },
}



