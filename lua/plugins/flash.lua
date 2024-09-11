
return {
    {
      'folke/flash.nvim',
      config = function()
        -- calling `setup` is optional for customization
      require("flash").setup({
        label = {
          uppercase = false,
        },
        modes = {
          search = {
            enabled = false,
          }, 
        },
      })
      end,
    },
}
