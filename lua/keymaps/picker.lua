
local function grep_cword_snacks()
  vim.cmd('normal viw')
  vim.cmd('normal 2e')
  return require("snacks").picker.files({ search = vim.getVisualSelection()})
end

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

local function grep_vword_snacks()
  -- return require("snacks").picker.files({search = "'" .. vim.getVisualSelection()})
  return require("snacks").picker.files({ search = vim.getVisualSelection()})
end

local function search_current_buffer_name_snacks()
  local search_string = vim.fn.expand("%:t") 
  return require("snacks").picker.grep({ search = search_string,})
end

local function search_string_fzflua()
  return require("fzf-lua").grep()
end

vim.keymap.set("n", "<leader>sg", "<cmd>lua require('snacks').picker.grep()<CR>", { silent = false, desc ="live grep glob" })
vim.keymap.set("n", "<leader>sw", "<cmd>lua require('snacks').picker.grep_word()<CR>", { silent = false, desc ="word"})
vim.keymap.set("", "<leader>gs", "<cmd>lua require('snacks').picker.git_status()<CR>", { silent = false, desc ="git status"})
vim.keymap.set("v", "<leader>gb", "<cmd>lua require('snacks').git.blame_line()<CR>", { silent = false, desc ="snacks blame line"})
vim.keymap.set("", "<leader>sR", "<cmd>lua require('snacks').picker.resume()<CR>", { silent = false, desc ="Resume"})
vim.keymap.set("n", "<leader>fb", "<cmd>lua require('snacks').picker.buffers()<CR>", { silent = false, desc ="Buffers"})
vim.keymap.set("n", "<leader>bt", "<cmd>lua require('snacks').picker.treesitter()<CR>", { silent = false, desc ="tree-sitter"})
vim.keymap.set("n", "<leader>sb", "<cmd>lua require('snacks').picker.recent()<CR>", { silent = false, desc ="Buffer list"})
vim.keymap.set("n", "<leader>sd", "<cmd>lua require('snacks').picker.git_diff()<CR>", { silent = false, desc ="git diff"})
vim.keymap.set("n", "<leader>sf", grep_cword_snacks, {desc = "Find file under curosr"})
vim.keymap.set("v", "<leader>sf", grep_vword_snacks, {desc = "Find file under curosr"})
vim.keymap.set("n", "<leader>sB",search_current_buffer_name_snacks,{ silent = true, desc = "Search current buffer file name" })
vim.keymap.set("n", "<leader>s/", search_string_fzflua, { silent = true , desc = "Grep search"})
