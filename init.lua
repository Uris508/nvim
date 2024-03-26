-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("telescope").load_extension("live_grep_args")
require("telescope").load_extension("fzf")
require("telescope").load_extension("recent_files")
require("telescope").load_extension("ui-select")
vim.diagnostic.disable()
require("telescope").setup({
  extensions = {
      file_browser = {layout_strategy = "horizontal", sorting_strategy = "ascending"},
      heading = {treesitter = true},
      ["ui-select"] = {require("telescope.themes").get_dropdown({})}
  },
  defaults = {
      cache_picker = {num_pickers = 10},
      dynamic_preview_title = true,
      layout_strategy = "vertical",
      layout_config = {vertical = {width = 0.9, height = 0.9, preview_height = 0.6, preview_cutoff = 0}},
      -- path_display = {"smart", shorten = {len = 5}},
      path_display = {"absolute"},
      scroll_strategy = "limit"

  },
  pickers = {
    live_grep = {
      only_sort_text = true
    }
  },
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    enabled = vim.fn.executable("cmake") == 1,
  },
})

-- flash.nvim
-- disable search jump
require("flash").setup({
  modes = {
    search = {
      enabled = false,
    }, 
  },
})


