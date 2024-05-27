-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>sg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
vim.keymap.set("n", "<c-P>", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
vim.keymap.set("n", "<leader>s'", "<cmd>lua require('fzf-lua').live_grep()<CR>", { silent = true })
vim.keymap.set("n", "<leader>s/", "<cmd>lua require('fzf-lua').grep()<CR>", { silent = true , desc = "fzf grep search"})
vim.api.nvim_set_keymap("n", "<Leader>sb",
  [[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]],
  {noremap = true, silent = true, desc = "Buffer list"})
vim.keymap.set("n", "<leader>fo", "<cmd>!start %:p:h<CR>", { silent = true, desc = "Open file folder" })
vim.keymap.set("n", "<leader>D", "<cmd>Dashboard<CR>", { silent = true, desc = "Open Dashboard" })
vim.keymap.set("n", "<leader>fp","<cmd>let @+=expand('%:.')<CR>",{ silent = true, desc = "Copy relative Path" })
vim.keymap.set("n", "<leader>fP","<cmd>let @+=expand('%:p')<CR>",{ silent = true, desc = "Copy full Path" })
vim.keymap.set("n", "<leader>fN","<cmd>let @+=expand('%:t')<CR>",{ silent = true, desc = "Copy file name" })
vim.keymap.set("n", "<leader>ch", "<cmd>%!xxd<CR>", { silent = true, desc = "Change to HEX format" })
vim.keymap.set("n", "<leader>cH", "<cmd>%!xxd -r<CR>", { silent = true, desc = "Change to ASCII format" })
vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>", { desc = "Open Oil.nvim" })
