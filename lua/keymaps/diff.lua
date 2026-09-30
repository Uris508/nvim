vim.keymap.set("n", "<leader>gl", function()
  Snacks.picker.git_log({
    confirm = function(picker)
      local item = picker:current()
      picker:close()

      local hash = item and (item.sha or item.commit or item.id)
      if hash then
        vim.cmd("DiffviewOpen " .. hash .. "^!")
      end
    end,
  })
end, { desc = "Git Log (Diffview)" })

vim.keymap.set("n", "<leader>gf", function()
  vim.cmd("DiffviewFileHistory %")
end, { desc = "Git Current File History (Diffview)" })

vim.keymap.set("n", "<leader>v", function()
  if next(require("diffview.lib").views) == nil then
    vim.cmd("DiffviewOpen")
  else
    vim.cmd("DiffviewClose")
  end
end,{desc = "toggle diffview"})

-- 設定 Beyond Compare 路徑記錄檔
local bcl_file = vim.fn.stdpath("cache") .. "/bc_left.txt"
local bcr_file = vim.fn.stdpath("cache") .. "/bc_right.txt"

-- 寫入檔案路徑的輔助函式
local function save_filepath(filepath, target_file)
  local f = io.open(target_file, "w")
  if f then
    f:write(filepath)
    f:close()
  end
end

-- 讀取檔案路徑的輔助函式
local function read_filepath(target_file)
  local f = io.open(target_file, "r")
  if not f then return nil end
  local content = f:read("*a")
  f:close()
  return content and content:gsub("%s+", "") or nil
end

-- 1. Keymap "<leader>bcl": 將當前檔案絕對路徑存為左側檔
vim.keymap.set("n", "<leader>bcl", function()
  local file_path = vim.fn.expand("%:p")
  if file_path == "" then
    vim.notify("Current buffer has no valid file path!", vim.log.levels.WARN)
    return
  end
  save_filepath(file_path, bcl_file)
  vim.notify("BC [Left File] set:\n" .. file_path, vim.log.levels.INFO)
end, { desc = "Set Beyond Compare Left File" })

-- 2. Keymap "<leader>bcr": 將當前檔案絕對路徑存為右側檔
vim.keymap.set("n", "<leader>bcr", function()
  local file_path = vim.fn.expand("%:p")
  if file_path == "" then
    vim.notify("Current buffer has no valid file path!", vim.log.levels.WARN)
    return
  end
  save_filepath(file_path, bcr_file)
  vim.notify("BC [Right File] set:\n" .. file_path, vim.log.levels.INFO)
end, { desc = "Set Beyond Compare Right File" })

-- 3. Keymap "<leader>bcc": 檢查並啟動 Beyond Compare 比較
vim.keymap.set("n", "<leader>bcc", function()
  local left = read_filepath(bcl_file)
  local right = read_filepath(bcr_file)

  if not left or left == "" then
    vim.notify("Left file not set! Press '<leader>bcl' in the target file first.", vim.log.levels.ERROR)
    return
  end

  if not right or right == "" then
    vim.notify("Right file not set! Press '<leader>bcr' in the target file first.", vim.log.levels.ERROR)
    return
  end

  -- 使用 bcomp (或 bcompare)，在背景啟動 Beyond Compare
  local cmd = string.format("start /B bcomp %s %s &", vim.fn.shellescape(left), vim.fn.shellescape(right))
  vim.fn.system(cmd)
  vim.notify("Launching Beyond Compare...", vim.log.levels.INFO)
end, { desc = "Compare files with Beyond Compare" })

vim.keymap.set("n", "<leader>dl", "<cmd>lua require('deltaview').setup()<CR><cmd>DeltaView<CR>", { silent = false, desc ="DeltaView"})
vim.keymap.set("n", "<leader>dm", "<cmd>lua require('deltaview').setup()<CR><cmd>DeltaMenu<CR>", { silent = false, desc ="DeltaMenu"})
vim.keymap.set("n", "<leader>da", "<cmd>lua require('deltaview').setup()<CR><cmd>Delta<CR>", { silent = false, desc ="Delta"})
vim.keymap.set("n", "<leader>df", "<cmd>windo diffthis<CR>", {silent = true, desc = "windo diffthis"})
