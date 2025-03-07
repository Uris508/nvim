-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.autoformat = false
vim.opt.title = true
vim.opt.titlestring = 'neovim - ' .. [[%{fnamemodify(getcwd(), ':t')}]]
vim.g.snacks_animate = true

vim.g.uris_logo = 'chafa c:/logo/doom1.png --format symbols --symbols vhalf --size 40x40'
local hr = tonumber(os.date('%H', os.time()))
if hr > 6 and hr <= 12 then 
  vim.g.uris_logo = 'chafa c:/logo/doom1.png --format symbols --symbols vhalf --size 40x40'
elseif hr > 12 and hr <= 16 then 
  vim.g.uris_logo = 'chafa c:/logo/doom2.png --format symbols --symbols vhalf --size 40x40'
elseif hr > 16 and hr <= 18 then 
  vim.g.uris_logo = 'chafa c:/logo/doom3.png --format symbols --symbols vhalf --size 40x40'
else 
  vim.g.uris_logo = 'chafa c:/logo/doom4.png --format symbols --symbols vhalf --size 40x40'
end
