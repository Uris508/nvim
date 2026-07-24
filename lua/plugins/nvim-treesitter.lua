return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")
    
    -- 設定編譯器
    require("nvim-treesitter.install").compilers = { "zig", "clang", "gcc" }

    -- 自動安裝所需的語法解析器
    ts.install({
      "c", "lua", "vim", "vimdoc", "query", "markdown", "gitcommit"
    })

    -- 當開啟檔案時啟用高亮
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
