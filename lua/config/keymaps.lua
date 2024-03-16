-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>sg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
vim.keymap.set("n", "<c-P>", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
vim.keymap.set("n", "<leader>s/", "<cmd>lua require('fzf-lua').grep()<CR>", { silent = true })
vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
vim.api.nvim_set_keymap("n", "<Leader>sb",
  [[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]],
  {noremap = true, silent = true})
vim.keymap.set("n", "<leader>fo", "<cmd>!start %:p:h<CR>", { silent = true })
vim.keymap.set("n", "<leader>D", "<cmd>Dashboard<CR>", { silent = true })
