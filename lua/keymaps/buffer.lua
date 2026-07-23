
local function OpenCurrentBufferPath()
  vim.cmd('set noshellslash')
  local path = vim.fn.expand("%:p:h")
  -- vim.print(path)
  -- return os.execute('explorer ' .. path)
  return os.execute('start onecommander ' .. '"'.. path .. '"')
end

local function showcwd()
      local text = vim.fn.getcwd()
      vim.notify(
         text,
         vim.log.levels.info,
         { title = "Project Path", timeout = 5000 }
      )
end

local function open_oil_at_last_buffer()
  local last_buf_path = vim.fn.expand("%:.")
      -- vim.notify(
      --    last_buf_path,
      --    vim.log.levels.info,
      --    { title = "Project Path", timeout = 5000 }
      -- )
      --
  if last_buf_path == "" then
    require("oil").open()
  else
    require("oil").open(last_buf_path)
    require("oil").open()
  end
end

vim.keymap.set("n", "<leader>o", open_oil_at_last_buffer, { desc = "Open Oil.nvim" })
vim.keymap.set("n", "<C-p>", showcwd, {silent = true, desc = "get project name"})
vim.keymap.set("n", "<leader>rr", "<cmd>edit!<CR>", {silent = true, desc = "reload buf"})
vim.keymap.set("n", "<leader>fp","<cmd>set noshellslash<CR><cmd>let @+=expand('%:.')<CR>",{ silent = false, desc = "Copy relative Path" })
vim.keymap.set("n", "<leader>fP","<cmd>set noshellslash<CR><cmd>let @+=expand('%:p')<CR>",{ silent = false, desc = "Copy full Path" })
vim.keymap.set("n", "<leader>fo", OpenCurrentBufferPath, { silent = false, desc = "Open file folder" })
