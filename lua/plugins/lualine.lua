 return {
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      local config = require("lualine")

      config.setup({
        options = {
          icons_enabled = true,
          theme = 'auto',
        },
        sections = {
          -- Add the macro recording status in the mode section
          lualine_a = {function()
            local reg = vim.fn.reg_recording()
            -- If a macro is being recorded, show "Recording @<register>"
            if reg ~= "" then
              return "Recording @" .. reg
            else
              -- Get the full mode name using nvim_get_mode()
              local mode = vim.api.nvim_get_mode().mode
              local mode_map = {
                n = 'NORMAL',
                i = 'INSERT',
                v = 'VISUAL',
                V = 'V-LINE',
                ['\22'] = 'V-BLOCK',
                c = 'COMMAND',
                R = 'REPLACE',
                s = 'SELECT',
                S = 'S-LINE',
                ['\19'] = 'S-BLOCK',
                t = 'TERMINAL',
              }

              -- Return the full mode name
              return mode_map[mode] or mode:upper()
            end
          end},

          lualine_c = {
            {
              'filename',
              path = 1,
              show_filename_only = false,
            },
          },
        },
      })
    end
  }
}
