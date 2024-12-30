-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.autoformat = false
vim.opt.title = true
vim.opt.titlestring = 'neovim - ' .. [[%{fnamemodify(getcwd(), ':t')}]]
vim.g.snacks_animate = false
