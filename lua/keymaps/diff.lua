
local function compare_with_bc()
    local current_file = vim.fn.expand('%:p')
    local target_file = current_file
    -- local target_file = vim.fn.input('Compare with: ', '', 'file')
    
    if target_file ~= "" then
        local bc_path = "bcomp" 
        os.execute(string.format('start /B %s "%s" "%s" &', bc_path, current_file, target_file))
    end
end

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
vim.keymap.set('n', '<leader>bc', compare_with_bc, { desc = 'Open Beyond Compare' })
vim.keymap.set("n", "<leader>dl", "<cmd>lua require('deltaview').setup()<CR><cmd>DeltaView<CR>", { silent = false, desc ="DeltaView"})
vim.keymap.set("n", "<leader>dm", "<cmd>lua require('deltaview').setup()<CR><cmd>DeltaMenu<CR>", { silent = false, desc ="DeltaMenu"})
vim.keymap.set("n", "<leader>da", "<cmd>lua require('deltaview').setup()<CR><cmd>Delta<CR>", { silent = false, desc ="Delta"})
vim.keymap.set("n", "<leader>df", "<cmd>windo diffthis<CR>", {silent = true, desc = "windo diffthis"})
