-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("telescope").load_extension("live_grep_args")
require("telescope").load_extension("fzf")
require("telescope").load_extension("recent_files")
vim.diagnostic.disable()
require("telescope").setup({
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    enabled = vim.fn.executable("cmake") == 1,
  },
})
