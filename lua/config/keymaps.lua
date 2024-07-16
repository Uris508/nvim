-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>sg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
vim.keymap.set("n", "<c-P>", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
vim.keymap.set("n", "<leader>s'", "<cmd>lua require('fzf-lua').live_grep()<CR>", { silent = true })
-- vim.keymap.set("n", "<leader>s/", "<cmd>lua require('fzf-lua').grep()<CR>", { silent = true , desc = "fzf grep search"})
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
local telescopebuiltin = require("telescope.builtin")
local function grep_cword()
  return telescopebuiltin.find_files({ default_text = vim.fn.expand('<cword>')})
end
vim.keymap.set("n", "<leader>sf", grep_cword, {desc = "Find file under curosr"})

function vim.getVisualSelection()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg('v')
	vim.fn.setreg('v', {})

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ''
	end
end
local function grep_vword()
  return telescopebuiltin.find_files({ default_text = vim.getVisualSelection()})
end
vim.keymap.set("v", "<leader>sf", grep_vword, {desc = "Find file for selected"})

local function search_string()
local input_string = vim.fn.input("Search For > ")
    if (input_string == '') then
      return
    end
    return telescopebuiltin.grep_string({search = input_string,})
end
vim.keymap.set("n", "<leader>s/", search_string, { silent = true , desc = "Grep search"})

local CustomCommentStr
local CustomCommentType

local function SetCustomCommentString()
  CustomCommentType = vim.fn.input("Fix/Feature/WA >")
  CustomCommentStr = vim.fn.input("Set Commnet string > ")
end

local function CustomCommentStringBegin()
  vim.cmd('normal O')
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local comment = "[" .. CustomCommentType .. "] " .. CustomCommentStr .. " >>>"
  vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { "[uris]" .. comment })
  vim.cmd('normal gcc')
end

local function CustomCommentStringEnd()
  vim.cmd('normal o')
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local comment = "[" .. CustomCommentType .. "] " .. CustomCommentStr .. " <<<"
  vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { "[uris]" .. comment })
  vim.cmd('normal gcc')
end

vim.keymap.set("n", "<leader>cG", SetCustomCommentString, {desc = "Set Custom Comment string"})
vim.keymap.set("n", "gcb", CustomCommentStringBegin, {desc = "Custom Comment Begin"})
vim.keymap.set("n", "gce", CustomCommentStringEnd, {desc = "Custom Comment End"})


