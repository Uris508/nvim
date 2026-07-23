
local CustomCommentStr = ''
local CustomCommentType
local username = ''
local default_username_wo_git_repo = ''
local cached_user = nil

local function get_git_user()
if not cached_user then
    local name = vim.fn.system("git config user.name")
    if vim.v.shell_error == 0 and name ~= "" then
      local trimmed_name = vim.trim(name)

      local first_word = string.match(trimmed_name, "%S+")

      if first_word then
        cached_user =  string.lower(first_word)
      else
        cached_user = default_username_wo_git_repo
      end
    else
      cached_user = default_username_wo_git_repo
    end
  end
  return cached_user
end

local function SetCustomCommentString()

  if vim.g.neovide then
  else
    -- require("smear_cursor").enabled = false
  end
  CustomCommentType = vim.fn.input("Custom commet for Fix/Feature/WA ?")
  CustomCommentStr = vim.fn.input("Set Commnet string > ")
  if vim.g.neovide then
  else
    -- require("smear_cursor").enabled = true
  end
  username = get_git_user()
  -- vim.print(username)
end

local function CustomCommentStringBegin()
  vim.cmd('normal O')
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local comment = "[" .. CustomCommentType .. "] " .. CustomCommentStr .. " >>>"
  vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { "[" .. username .. "]" .. comment })
  vim.cmd('normal gcc')
end

local function CustomCommentStringEnd()
  vim.cmd('normal o')
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local comment = "[" .. CustomCommentType .. "] " .. CustomCommentStr .. " <<<"
  vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { "[" .. username .. "]" .. comment })
  vim.cmd('normal gcc')
end

local function CustomCommnetStringLine()
  vim.cmd('normal O')
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local comment1= "[" .. CustomCommentType .. "] " .. CustomCommentStr .. " >>>"
  vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { "[" .. username .. "]" .. comment1 })
  vim.cmd('normal gcc')
  vim.cmd('normal j')
  vim.cmd('normal o')
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local comment2= "[" .. CustomCommentType .. "] " .. CustomCommentStr .. " <<<"
  vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { "[" .. username .. "]" .. comment2 })
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
  vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { "[" .. username .. "]" .. comment1 })
  vim.cmd('normal o')
  vim.cmd('normal k')
  vim.cmd('normal gcc')
  vim.cmd('normal j')
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local comment2= "[" .. CustomCommentType .. "] " .. CustomCommentStr .. " <<<"
  vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { "[" .. username .. "]" .. comment2 })
  vim.cmd('normal gcc')

  vim.cmd('normal k')
  vim.cmd('normal p')
  
end

vim.keymap.set("n", "<leader>cG", SetCustomCommentString, {desc = "Set Custom Comment string"})
vim.keymap.set("n", "gcb", CustomCommentStringBegin, {desc = "Custom Comment Begin"})
vim.keymap.set("n", "gce", CustomCommentStringEnd, {desc = "Custom Comment End"})
vim.keymap.set("n", "gcl", CustomCommnetStringLine, {desc = "Custom Comment Line"})
vim.keymap.set("v", "gb", CustomCommentStringBlock, {desc = "Custom Comment Block"})
