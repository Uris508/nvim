if true then
  return {
    {
      "nvim-telescope/telescope.nvim",
      dependencies = {
        {
          "nvim-telescope/telescope-live-grep-args.nvim",
          -- This will not install any breaking changes.
          -- For major updates, this must be adjusted manually.
          version = "^1.0.0",
        },
      },
      config = function()
        require("telescope").load_extension("live_grep_args")
      end,
    },
    {
      "ibhagwan/fzf-lua",
      -- optional for icon support
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        -- calling `setup` is optional for customization
        require("fzf-lua").setup({})
      end,
    },
    {"smartpde/telescope-recent-files"},
    {"nvim-telescope/telescope-ui-select.nvim"},
  }
end
