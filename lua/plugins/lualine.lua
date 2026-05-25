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

          lualine_b = {
            {
              function()
                -- 1. 最準確：如果 Gitsigns 運作正常，優先使用
                if vim.b.gitsigns_head and vim.b.gitsigns_head ~= "" then
                  return '' .. vim.b.gitsigns_head
                end

                -- 2. 繞過 Snacks picker 路徑問題的終極解法 (零延遲)：
                -- 直接從當前專案的工作目錄 (CWD) 讀取 .git/HEAD，不依賴有爭議的檔案路徑
                local git_dir = vim.fn.finddir('.git', vim.fn.getcwd() .. ';')
                if git_dir ~= "" then
                  local head_file = git_dir .. '/HEAD'
                  local f = io.open(head_file, 'r')
                  if f then
                    local content = f:read('*l')
                    f:close()
                    if content then
                      local branch = content:match('ref: refs/heads/(.+)')
                      if branch then
                        return '' .. branch
                      else
                        -- 處理 Detached HEAD 狀態，顯示 commit hash 前 7 碼
                        return '' .. content:sub(1, 7)
                      end
                    end
                  end
                end

                -- 3. 最後的備案：呼叫 Lualine 內建的函數
                local fallback = require('lualine.components.branch.git_branch').get_branch()
                if fallback and fallback ~= "" then
                  return '' .. fallback
                end

                return ""
              end,
              
              -- 確保它不會在 Snacks 的浮動視窗或終端機裡胡亂顯示
              cond = function()
                return vim.bo.buftype == "" 
              end,
            },
            
            -- 保留原本的元件
            'diff',
            'diagnostics',
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
