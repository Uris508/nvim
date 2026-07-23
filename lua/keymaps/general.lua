-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function transparent_off()
  require("tokyonight").setup {
    transparent = false,
  }
  vim.cmd("colorscheme tokyonight")
end

local function transparent_on()
  require("tokyonight").setup {
    transparent = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
  }
  vim.cmd("colorscheme tokyonight")
end

vim.keymap.set("n", "<leader>D", "<cmd>lua require('snacks').dashboard.open()<CR>", { silent = false, desc = "Open Dashboard" })
vim.keymap.set("n", "<leader>fN","<cmd>let @+=expand('%:t')<CR>",{ silent = false, desc = "Copy file name" })
vim.keymap.set("n", "<leader>ch", function()
  require("hex_reader").toggle()
end, { desc = "Toggle hex reader." })
vim.keymap.set("n", "c", "\"_c", { desc = "remove wo copy" })
vim.keymap.set('n', 'q:', '<Nop>', { noremap = true, silent = true, nowait = true })
vim.keymap.set("n", "<leader>me", "<cmd>lua require('render-markdown').enable()<CR>", {silent = true, desc = "enable render markdown"})
vim.keymap.set("n", "<leader>md", "<cmd>lua require('render-markdown').disable()<CR>", {silent = true, desc = "disable render markdown"})
vim.keymap.set("v", "<leader>rs", "<cmd>s/\\%V\\\\/\\//g<CR>", {silent = true, desc = "replace to forward slash"})
vim.keymap.set("v", "<leader>rS", "<cmd>s/\\%V\\//\\\\/g<CR>", {silent = true, desc = "replace to backslash"})
vim.keymap.set("n", "<leader>cp", "<cmd>Snap html<CR>", {silent = true, desc = "Code Snap"})
vim.keymap.set("n", "<C-x>", ":m .-2<CR>==", { silent = true })
vim.keymap.set("n", "<C-c>", ":m .+1<CR>==", { silent = true })
vim.keymap.set("n", "<leader>td", transparent_off, {silent = true, desc = "disable transparent"})
vim.keymap.set("n", "<leader>te", transparent_on, {silent = true, desc = "enable transparent"})
vim.keymap.set("v" , "<leader>cp", ":Snap html", {desc = "Code Snap"})
-- vim.keymap.set('v', '<Leader>cs',  ":SSSelected", {desc = "CodeShot"})
vim.keymap.set("n", "<leader>C","<cmd>Calendar<CR>",{ silent = false, desc = "Calendar" })
vim.keymap.set("n", "<leader>k","<cmd>Screenkey toggle<CR>",{ silent = false, desc = "Screenkey toggle" })
vim.keymap.set("n", "<leader>ux", "<cmd>ScreensaverToggle<CR>", { silent = false, desc ="ScreensaverToggle"})


