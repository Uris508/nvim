-- 建立一個產生 UUID 的函式並插入游標處
local function insert_uuid()
  local template ='xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
  local uuid = string.gsub(template, '[xy]', function (c)
    local v = (c == 'x') and math.random(0, 0xf) or math.random(8, 0xb)
    return string.format('%x', v)
  end)
  
  -- 插入到當前游標位置
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { uuid })
end

local function insert_c_struct_guid()
  -- 設定隨機數種子（確保每次產生的不重複）
  math.randomseed(os.time() + os.clock() * 100000)

  -- Data1: 32-bit (8 個十六進位字元)
  local d1 = string.format("0x%08x", math.random(0, 0xffffffff))

  -- Data2: 16-bit (4 個十六進位字元)
  local d2 = string.format("0x%04x", math.random(0, 0xffff))

  -- Data3: 16-bit (UUID v4 規範第一個字元通常固定為 4)
  local d3 = string.format("0x%04x", math.random(0x4000, 0x4fff))

  -- Data4: 8 個 8-bit Byte
  local d4_bytes = {}
  -- 第一個 byte 依照 UUID v4 規範限制範圍為 0x80~0xbf
  table.insert(d4_bytes, string.format("0x%02x", math.random(0x80, 0xbf)))
  for _ = 2, 8 do
    table.insert(d4_bytes, string.format("0x%02x", math.random(0x00, 0xff)))
  end

  -- 組合成 C 語言 GUID 結構字串
  local guid_str = string.format(
    "{ %s, %s, %s, {%s} }",
    d1,
    d2,
    d3,
    table.concat(d4_bytes, ", ")
  )

  -- 取得目前游標位置並插入字串
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { guid_str })
end

local function convert_uuid_to_c_struct_in_line()
  local line = vim.api.nvim_get_current_line()

  -- 使用 string.gsub 進行局部替換
  local new_line, count = line:gsub(
    "(%x%x%x%x%x%x%x%x)%-(%x%x%x%x)%-(%x%x%x%x)%-(%x%x)(%x%x)%-(%x%x)(%x%x)(%x%x)(%x%x)(%x%x)(%x%x)",
    function(p1, p2, p3, p4_1, p4_2, p5_1, p5_2, p5_3, p5_4, p5_5, p5_6)
      return string.format(
        "{ 0x%s, 0x%s, 0x%s, {0x%s, 0x%s, 0x%s, 0x%s, 0x%s, 0x%s, 0x%s, 0x%s} }",
        p1, p2, p3, p4_1, p4_2, p5_1, p5_2, p5_3, p5_4, p5_5, p5_6
      )
    end
  )

  if count == 0 then
    vim.notify("can't find uuid format string", vim.log.levels.WARN)
    return false
  end

  vim.api.nvim_set_current_line(new_line)
  return true
end

local function convert_c_struct_to_uuid_in_line()
  local line = vim.api.nvim_get_current_line()

  -- 自動補 0 的輔助函式
  local function pad(hex, length)
    return string.format("%0" .. length .. "x", tonumber(hex, 16))
  end

  -- 匹配包含大括號的完整 C 結構特徵並進行局部替換
  local pattern = "{%s*0x(%x+)%s*,%s*0x(%x+)%s*,%s*0x(%x+)%s*,%s*{%s*0x(%x+)%s*,%s*0x(%x+)%s*,%s*0x(%x+)%s*,%s*0x(%x+)%s*,%s*0x(%x+)%s*,%s*0x(%x+)%s*,%s*0x(%x+)%s*,%s*0x(%x+)%s*}%s*}"

  local new_line, count = line:gsub(
    pattern,
    function(d1, d2, d3, b1, b2, b3, b4, b5, b6, b7, b8)
      return string.format(
        "%s-%s-%s-%s%s-%s%s%s%s%s%s",
        pad(d1, 8), pad(d2, 4), pad(d3, 4),
        pad(b1, 2), pad(b2, 2),
        pad(b3, 2), pad(b4, 2), pad(b5, 2), pad(b6, 2), pad(b7, 2), pad(b8, 2)
      )
    end
  )

  if count == 0 then
    vim.notify("can't find c struct guid format string", vim.log.levels.WARN)
    return false
  end

  vim.api.nvim_set_current_line(new_line)
  return true
end

local function toggle_guid_format()
  -- 先嘗試轉為標準 UUID；若失敗則嘗試轉為 C 結構
  if not convert_c_struct_to_uuid_in_line() then
    convert_uuid_to_c_struct_in_line()
  end
end

-- 設定快捷鍵（例如按下 <leader>id 插入 GUID）
vim.keymap.set('n', '<leader>cuu', insert_uuid, { desc = 'Insert UUID' })
vim.keymap.set('n', '<leader>cug', insert_c_struct_guid, { desc = 'Insert C struct GUID'})
vim.keymap.set('n', '<leader>cut', toggle_guid_format, { desc = 'Toggle GUID Format' })
