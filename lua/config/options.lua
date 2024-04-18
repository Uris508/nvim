-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.autoformat = false
vim.opt.title = true
vim.opt.titlestring = [[%{fnamemodify(getcwd(), ':f')}]]
vim.g.neovide_refresh_rate = 60
vim.g.neovide_cursor_vfx_mode = "railgun"
