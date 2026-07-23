-- lua/config/keymaps.lua
local keymap_modules = {
  "keymaps.general",
  "keymaps.uuid",
  "keymaps.picker",
  "keymaps.comment",
  "keymaps.diff",
  "keymaps.buffer",
}

for _, module in ipairs(keymap_modules) do
  local ok, err = pcall(require, module)
  if not ok then
    vim.notify("load keymap modules failed " .. module .. "\n" .. err, vim.log.levels.ERROR)
  end
end
