 return {
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      local config = require("lualine")

      config.setup({
        options = {
          icons_enabled = true,
          theme = 'auto',
        },
        sections = {
          lualine_a = {
            {
              'mode',
              -- 1. 使用 fmt 動態改變文字內容
              fmt = function(str)
                local reg = vim.fn.reg_recording()
                if reg ~= "" then
                  return "MACRO @" .. reg
                end
                return str
              end,

              -- 2. 使用 color 動態改變顏色 (這裡範例使用紅底白字，可依喜好修改)
              color = function()
                local reg = vim.fn.reg_recording()
                if reg ~= "" then
                  return { bg = "#e06c75", fg = "#e5c07b", gui = "bold" }
                end
                return nil
              end,
            }
          },

          lualine_c = {
            {
              'filename',
              path = 1,
              show_filename_only = false,
            },
          },

          -- 💡 建議也補上右半邊的預設元件，否則右邊會空無一物
          lualine_x = { 'encoding', 'fileformat', 'filetype' }, -- 檔案編碼、格式、類型
          lualine_y = { 'progress' },                           -- 檔案瀏覽進度百分比
          lualine_z = { 'location' },                           -- 目前的游標行號與列號
        },
      })
    end
  }
}
