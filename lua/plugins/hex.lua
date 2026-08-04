return {
  'RaafatTurki/hex.nvim',
  event = "VeryLazy",
  config = function()
    require('hex').setup({
      is_file_binary_post_read = function()
          -- 1. 取得當前 Buffer 的檔名或完整路徑
          local buf_name = vim.api.nvim_buf_get_name(0)

          -- 2. 定義你想自動開啟 HEX 模式的副檔名清單
          local allowed_extensions = { "bin", "dat", "fd", "sig", "sbin" }

          -- 3. 取得當前檔案的副檔名
          local ext = vim.fn.fnamemodify(buf_name, ":e")

          -- 4. 檢查副檔名是否在白名單中
          for _, target_ext in ipairs(allowed_extensions) do
            if ext:lower() == target_ext:lower() then
              return true -- 回傳 true 代表觸發 Hex 模式
            end
          end

          return false -- 其他副檔名一律不開啟 Hex 模式
        end,
    })
  end
}
