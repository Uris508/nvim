-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- require("telescope").load_extension("live_grep_args")
-- require("telescope").load_extension("fzf")
-- require("telescope").load_extension("recent_files")
-- require("telescope").load_extension("ui-select")


local function charinput()
	return '<C-\\><C-N>"' .. vim.fn.nr2char(vim.fn.getchar()) .. 'pi'
end
local alpha = function()
  return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
end

vim.g.snacks_animate = false
vim.keymap.set('t', '<C-R>', charinput, { expr = true })
if vim.g.neovide then
  vim.keymap.set('n', '<c-s>', ':w<CR>') -- Save
  vim.keymap.set('v', '<c-c>', '"+y') -- Copy
  vim.keymap.set('n', '<c-v>', '"+P') -- Paste normal mode
  vim.keymap.set('v', '<c-v>', '"+P') -- Paste visual mode
  vim.keymap.set('t', '<c-v>', '"+P') -- Paste visual mode
  vim.keymap.set('c', '<c-v>', '<C-R>+') -- Paste command mode
  vim.keymap.set('i', '<c-v>', '<ESC>l"+Pli') -- Paste insert mode
  vim.keymap.set('t', '<C-v>', charinput, { expr = true })
  vim.g.neovide_refresh_rate = 60
  -- vim.g.neovide_cursor_vfx_mode = "wireframe"
  vim.g.neovide_no_idle = true
  vim.g.neovide_opacity = 1.0
  vim.g.transparency = 0.9
  vim.g.neovide_background_color = "#0f1117" .. alpha()
  vim.g.neovide_cursor_trail_size = 1.0
  vim.g.neovide_cursor_animation_length = 0.10
  vim.g.snacks_animate = false
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
  require('smear_cursor').enabled = false
end
require('smear_cursor').enabled = false
vim.diagnostic.disable()
vim.opt.wrap = false

-- local actions = require "telescope.actions"
--
-- require("telescope").setup({
--   extensions = {
--       file_browser = {layout_strategy = "horizontal", sorting_strategy = "ascending"},
--       heading = {treesitter = true},
--       ["ui-select"] = {require("telescope.themes").get_dropdown({})}
--   },
--   defaults = {
--       cache_picker = {num_pickers = 10},
--       dynamic_preview_title = true,
--       layout_strategy = "vertical",
--       layout_config = {vertical = {width = 0.9, height = 0.9, preview_height = 0.6, preview_cutoff = 0}},
--       -- path_display = {"smart", shorten = {len = 5}},
--       path_display = {"absolute"},
--       scroll_strategy = "limit",
--       mappings = {
--         i = {
--             ["<C-j>"] = actions.move_selection_next,
--             ["<C-k>"] = actions.move_selection_previous,
--         }
--       },
--
--   },
--   pickers = {
--     live_grep = {
--       only_sort_text = true
--     }
--   },
--   dependencies = {
--     "nvim-telescope/telescope-fzf-native.nvim",
--     build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
--     enabled = vim.fn.executable("cmake") == 1,
--   },
-- })

-- flash.nvim
-- disable search jump
-- use lowercase label only
-- mini indentscope
-- disable animation 
-- require("mini.indentscope").setup({
--   symbol = "│",
--   options = { try_as_border = true },
--   draw = {
--     animation = require("mini.indentscope").gen_animation.none(),
--   },
-- })
-- lualine 
-- do not shorten path
-- aerial
-- change windows to left
-- require("aerial").setup({
--   layout = {
--     default_direction = "prefer_left",
--   },
-- })
-- neoscroll
-- require('neoscroll').setup()
-- oil.nvim
-- require("oil").setup()
