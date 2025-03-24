
return {

    {
      "ibhagwan/fzf-lua",
      -- optional for icon support
      dependencies = { "nvim-tree/nvim-web-devicons" },
      keys = {
        { "<leader>sg", false },
        { "<leader><leader>", false },
        { "<leader>sw", false },
        { "<leader>gs", false },
        { "<leader>fb", false },
        { "<leader>sR", false },
      },
      config = function()
        -- calling `setup` is optional for customization
        require("fzf-lua").setup({
          'max-perf',
          winopts = {
            preview = {
              layout = 'vertical',
              vertical = 'up',
            },
            width = 1,
          },
         -- preview_layout = 'vertical',

        })
      end,
    },
}
