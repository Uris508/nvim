-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- vim.keymap.set("n", "<leader>sg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
-- vim.keymap.set("n", "<c-P>", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
-- vim.keymap.set("n", "<leader>sg", "<cmd>lua require('fzf-lua').live_grep_glob()<CR>", { silent = true, desc ="live grep glob" })
vim.keymap.set("n", "<leader>sg", "<cmd>lua require('snacks').picker.grep()<CR>", { silent = false, desc ="live grep glob" })
vim.keymap.set("n", "<leader><leader>", "<cmd>lua require('snacks').picker.files()<CR>", { silent = false, desc ="find files" })
vim.keymap.set("n", "<leader>sw", "<cmd>lua require('snacks').picker.grep_word()<CR>", { silent = false, desc ="word"})
vim.keymap.set("", "<leader>gs", "<cmd>lua require('snacks').picker.git_status()<CR>", { silent = false, desc ="git status"})
vim.keymap.set("v", "<leader>gb", "<cmd>lua require('snacks').git.blame_line()<CR>", { silent = false, desc ="snacks blame line"})
vim.keymap.set("", "<leader>sR", "<cmd>lua require('snacks').picker.resume()<CR>", { silent = false, desc ="Resume"})
vim.keymap.set("n", "<leader>fb", "<cmd>lua require('snacks').picker.buffers()<CR>", { silent = false, desc ="Buffers"})
-- vim.keymap.set("n", "<leader>s/", "<cmd>lua require('fzf-lua').grep()<CR>", { silent = true , desc = "fzf grep search"})
-- vim.api.nvim_set_keymap("n", "<Leader>sb",
--   [[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]],
--   {noremap = true, silent = true, desc = "Buffer list"})
vim.keymap.set("n", "<leader>sb", "<cmd>lua require('snacks').picker.recent()<CR>", { silent = false, desc ="Buffer list"})
vim.keymap.set("n", "<leader>sd", "<cmd>lua require('snacks').picker.git_diff()<CR>", { silent = false, desc ="git diff"})
-- vim.keymap.set("n", "<leader>fo", "<cmd>!explorer %:p:h<CR>", { silent = true, desc = "Open file folder" })
-- vim.keymap.set("n", "<leader>D", "<cmd>Dashboard<CR>", { silent = false, desc = "Open Dashboard" })
vim.keymap.set("n", "<leader>D", "<cmd>lua require('snacks').dashboard.open()<CR>", { silent = false, desc = "Open Dashboard" })
vim.keymap.set("n", "<leader>fp","<cmd>set noshellslash<CR><cmd>let @+=expand('%:.')<CR>",{ silent = false, desc = "Copy relative Path" })
vim.keymap.set("n", "<leader>fP","<cmd>set noshellslash<CR><cmd>let @+=expand('%:p')<CR>",{ silent = false, desc = "Copy full Path" })
vim.keymap.set("n", "<leader>fN","<cmd>let @+=expand('%:t')<CR>",{ silent = false, desc = "Copy file name" })
-- vim.keymap.set("n", "<leader>ch", "<cmd>%!xxd<CR>", { silent = false, desc = "Change to HEX format" })
-- vim.keymap.set("n", "<leader>cH", "<cmd>%!xxd -r<CR>", { silent = false, desc = "Change to ASCII format" })
vim.keymap.set("n", "<leader>ch", function()
  require("hex_reader").toggle()
end, { desc = "Toggle hex reader." })
vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>", { desc = "Open Oil.nvim" })
vim.keymap.set("n", "c", "\"_c", { desc = "remove wo copy" })
vim.keymap.set("", "q:", "", {})
vim.keymap.set("n", "<leader>me", "<cmd>lua require('render-markdown').enable()<CR>", {silent = true, desc = "enable render markdown"})
vim.keymap.set("n", "<leader>md", "<cmd>lua require('render-markdown').disable()<CR>", {silent = true, desc = "disable render markdown"})
vim.keymap.set("n", "<leader>rr", "<cmd>edit!<CR>", {silent = true, desc = "reload buf"})
vim.keymap.set("n", "<leader>df", "<cmd>windo diffthis<CR>", {silent = true, desc = "windo diffthis"})
vim.keymap.set("v", "<leader>rs", "<cmd>s/\\%V\\\\/\\//g<CR>", {silent = true, desc = "replace to forward slash"})

local function showcwd()
      local text = vim.fn.getcwd()
      vim.notify(
         text,
         vim.log.levels.info,
         { title = "Project Path", timeout = 5000 }
      )
end
vim.keymap.set("n", "<C-p>", showcwd, {silent = true, desc = "get project name"})


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

vim.keymap.set("n", "<leader>td", transparent_off, {silent = true, desc = "disable transparent"})
vim.keymap.set("n", "<leader>te", transparent_on, {silent = true, desc = "enable transparent"})

local function OpenCurrentBufferPath()
  vim.cmd('set noshellslash')
  local path = vim.fn.expand("%:p:h")
  -- vim.print(path)
  -- return os.execute('explorer ' .. path)
  return os.execute('start onecommander ' .. path)
end
vim.keymap.set("n", "<leader>fo", OpenCurrentBufferPath, { silent = false, desc = "Open file folder" })

-- local telescopebuiltin = require("telescope.builtin")
-- local function grep_cword()
--   return telescopebuiltin.find_files({ default_text = "'" .. vim.fn.expand('<cword>')})
-- end
-- vim.keymap.set("n", "<leader>sf", grep_cword, {desc = "Find file under curosr"})

-- local FzfLuabuiltin = require("fzf-lua")
-- local function grep_cword_fzflua()
--   return require("fzf-lua").files({query = "'" .. vim.fn.expand('<cword>')})
--   -- return require("snacks").picker.files({query = "'" .. vim.fn.expand('<cword>')})
-- end
-- vim.keymap.set("n", "<leader>sf", grep_cword_fzflua, {desc = "Find file under curosr"})

local function grep_cword_snacks()
  vim.cmd('normal viw')
  vim.cmd('normal 2e')
  return require("snacks").picker.files({ search = vim.getVisualSelection()})
end
vim.keymap.set("n", "<leader>sf", grep_cword_snacks, {desc = "Find file under curosr"})

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
-- local function grep_vword()
--   return telescopebuiltin.find_files({ default_text = "'" .. vim.getVisualSelection()})
-- end
-- vim.keymap.set("v", "<leader>sf", grep_vword, {desc = "Find file for selected"})

-- local function grep_vword_fzflua()
--   return require("fzf-lua").files({query = "'" .. vim.getVisualSelection()})
-- end
-- vim.keymap.set("v", "<leader>sf", grep_vword_fzflua, {desc = "Find file under curosr"})

local function grep_vword_snacks()
  -- return require("snacks").picker.files({search = "'" .. vim.getVisualSelection()})
  return require("snacks").picker.files({ search = vim.getVisualSelection()})
end
vim.keymap.set("v", "<leader>sf", grep_vword_snacks, {desc = "Find file under curosr"})

-- local function search_string()
-- local input_string = vim.fn.input("Search For > ")
--     if (input_string == '') then
--       return
--     end
--     return telescopebuiltin.grep_string({search = input_string,})
-- end
-- vim.keymap.set("n", "<leader>s/", search_string, { silent = true , desc = "Grep search"})

local function search_string_fzflua()
  return require("fzf-lua").grep()
end
vim.keymap.set("n", "<leader>s/", search_string_fzflua, { silent = true , desc = "Grep search"})

-- local function search_current_buffer_name()
--   return telescopebuiltin.live_grep({ default_text = vim.fn.expand("%:t")})
-- end
-- vim.keymap.set("n", "<leader>sB",search_current_buffer_name,{ silent = true, desc = "Search current buffer file name" })

-- local function search_current_buffer_name_fzflua()
--   local search_string = vim.fn.expand("%:t") 
--   return require("fzf-lua").live_grep_glob({ query = search_string})
-- end
-- vim.keymap.set("n", "<leader>sB",search_current_buffer_name_fzflua,{ silent = true, desc = "Search current buffer file name" })

local function search_current_buffer_name_snacks()
  local search_string = vim.fn.expand("%:t") 
  return require("snacks").picker.grep({ search = search_string,})
end
vim.keymap.set("n", "<leader>sB",search_current_buffer_name_snacks,{ silent = true, desc = "Search current buffer file name" })


local CustomCommentStr = ''
local CustomCommentType

local function SetCustomCommentString()

  if vim.g.neovide then
  else
    require("smear_cursor").enabled = false
  end
  CustomCommentType = vim.fn.input("Custom commet for Fix/Feature/WA ?")
  CustomCommentStr = vim.fn.input("Set Commnet string > ")
  if vim.g.neovide then
  else
    require("smear_cursor").enabled = true
  end
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

local function CustomCommnetStringLine()
  vim.cmd('normal O')
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local comment1= "[" .. CustomCommentType .. "] " .. CustomCommentStr .. " >>>"
  vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { "[uris]" .. comment1 })
  vim.cmd('normal gcc')
  vim.cmd('normal j')
  vim.cmd('normal o')
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local comment2= "[" .. CustomCommentType .. "] " .. CustomCommentStr .. " <<<"
  vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { "[uris]" .. comment2 })
  vim.cmd('normal gcc')
end


local function CustomCommentStringBlock()
  if (CustomCommentStr == '') then
    vim.print("custom comment string is empty")
    return
  end
  vim.cmd('normal d')
  
  vim.cmd('normal O')
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local comment1= "[" .. CustomCommentType .. "] " .. CustomCommentStr .. " >>>"
  vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { "[uris]" .. comment1 })
  vim.cmd('normal o')
  vim.cmd('normal k')
  vim.cmd('normal gcc')
  vim.cmd('normal j')
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local comment2= "[" .. CustomCommentType .. "] " .. CustomCommentStr .. " <<<"
  vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { "[uris]" .. comment2 })
  vim.cmd('normal gcc')

  vim.cmd('normal k')
  vim.cmd('normal p')
  
end

vim.keymap.set("n", "<leader>cG", SetCustomCommentString, {desc = "Set Custom Comment string"})
vim.keymap.set("n", "gcb", CustomCommentStringBegin, {desc = "Custom Comment Begin"})
vim.keymap.set("n", "gce", CustomCommentStringEnd, {desc = "Custom Comment End"})
vim.keymap.set("n", "gcl", CustomCommnetStringLine, {desc = "Custom Comment Line"})
vim.keymap.set("v", "gb", CustomCommentStringBlock, {desc = "Custom Comment Block"})

vim.keymap.set("n", "<leader>v", function()
  if next(require("diffview.lib").views) == nil then
    vim.cmd("DiffviewOpen")
  else
    vim.cmd("DiffviewClose")
  end
end,{desc = "toggle diffview"})

-- Take screenshot just of selected lines
-- vim.keymap.set('v', '<Leader>cs',  "<cmd>lua require('codeshot').selected_lines()<CR>", {desc = "CodeShot"})
vim.keymap.set('v', '<Leader>cs',  ":SSSelected", {desc = "CodeShot"})

