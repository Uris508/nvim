
return {

    {
      "ibhagwan/fzf-lua",
      -- optional for icon support
      dependencies = { "nvim-tree/nvim-web-devicons" },
      keys = {
        { "<leader>sg", false },
      },
      config = function()
        -- calling `setup` is optional for customization
        require("fzf-lua").setup({
          winopts = {
            preview = {
              vertical = 'up',
            },
            width = 1,
          },
         preview_layout = 'vertical',
        })
      end,
    },
}
