-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.autoformat = false
vim.opt.title = true
vim.opt.titlestring = 'neovim - ' .. [[%{fnamemodify(getcwd(), ':t')}]]
vim.g.lazyvim_picker = "snacks"
vim.opt.timeoutlen = 40

vim.g.uris_logo = 'chafa c:/logo/doom/doom3.png --format symbols --size 46x46'
local hr = tonumber(os.date('%H', os.time()))
if hr > 8 and hr <= 10 then 
  vim.g.uris_logo = 'chafa %localappdata%/nvim/doom/Gemini_Generated_sandy.png --format symbols --symbols vhalf --size 50x60'
elseif hr > 10 and hr <= 12 then 
  vim.g.uris_logo = 'chafa %localappdata%/nvim/doom/Gemini_Generated_Krabs.png --format symbols --symbols vhalf --size 40x40'
elseif hr > 12 and hr <= 14 then 
  vim.g.uris_logo = 'chafa %localappdata%/nvim/doom/Gemini_Generated_Patrick.png --format symbols --symbols vhalf --size 40x40'
elseif hr > 14 and hr <= 16 then 
  vim.g.uris_logo = 'chafa %localappdata%/nvim/doom/Gemini_Generated_SpongeBob.png --format symbols --symbols vhalf --size 40x40'
elseif hr > 16 and hr <= 18 then 
  vim.g.uris_logo = 'chafa %localappdata%/nvim/doom/Gemini_Generated_Squidward.png --format symbols --symbols vhalf --size 40x40'
elseif hr > 18 and hr <= 21 then 
  vim.g.uris_logo = 'chafa %localappdata%/nvim/doom/Gemini_Generated_Plankton.png --format symbols --symbols vhalf --size 40x40'
else 
  vim.g.uris_logo = 'chafa %localappdata%/nvim/doom/Gemini_Generated_FlyingDutchman.png --format symbols --symbols vhalf --size 40x40'
end
