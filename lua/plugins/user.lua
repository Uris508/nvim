if true then
  return {
    {
    "nvim-telescope/telescope.nvim",
    --   dependencies = {
    --     {
    --       "nvim-telescope/telescope-live-grep-args.nvim",
    --       -- This will not install any breaking changes.
    --       -- For major updates, this must be adjusted manually.
    --       version = "^1.0.0",
    --     },
    --   },
    --   config = function()
    --     require("telescope").load_extension("live_grep_args")
    --   end,
    },
    {
      "ibhagwan/fzf-lua",
      -- optional for icon support
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        -- calling `setup` is optional for customization
        require("fzf-lua").setup({
          winopts = {
            preview = {
              vertical = 'up',
            },
          },
         preview_layout = 'vertical',
        })
      end,
    },
    {"smartpde/telescope-recent-files"},
    {"nvim-telescope/telescope-ui-select.nvim"},
    {
      "stevearc/oil.nvim",
      opts = {},
      -- Optional dependencies
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        require("oil").setup({
          default_file_explorer = true,
        })
      end,
    },

    {'romgrk/barbar.nvim',
      dependencies = {
        'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
        'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
      },
      init = function() vim.g.barbar_auto_setup = false end,
      opts = {
        -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
        -- animation = true,
        -- insert_at_start = true,
        -- …etc.
      },
      version = '^1.0.0', -- optional: only update when a new 1.x version is released
    },

    {
      "nvimdev/dashboard-nvim",
      lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
      opts = function()
        local logo = [[
            ██╗   ██╗██████╗ ██╗███████╗██╗   ██╗██╗███╗   ███╗          s 
            ██║   ██║██╔══██╗██║██╔════╝██║   ██║██║████╗ ████║      i     
            ██║   ██║██████╔╝██║███████╗██║   ██║██║██╔████╔██║   r        
            ██║   ██║██╔══██╗██║╚════██║╚██╗ ██╔╝██║██║╚██╔╝██║ u          
            ╚██████╔╝██║  ██║██║███████║ ╚████╔╝ ██║██║ ╚═╝ ██║            
        ]]

        logo = string.rep("\n", 8) .. logo .. "\n\n"

        local opts = {
          theme = "doom",
          hide = {
            -- this is taken care of by lualine
            -- enabling this messes up the actual laststatus setting after loading a file
            statusline = false,
          },
          config = {
            header = vim.split(logo, "\n"),
            -- stylua: ignore
            center = {
              { action = 'lua LazyVim.pick()()',                           desc = " Find File",       icon = " ", key = "f" },
              { action = "ene | startinsert",                              desc = " New File",        icon = " ", key = "n" },
              { action = 'lua LazyVim.pick("oldfiles")()',                 desc = " Recent Files",    icon = " ", key = "r" },
              { action = 'lua LazyVim.pick("live_grep")()',                desc = " Find Text",       icon = " ", key = "g" },
              { action = 'lua LazyVim.pick.config_files()()',              desc = " Config",          icon = " ", key = "c" },
              { action = 'lua require("persistence").load()',              desc = " Restore Session", icon = " ", key = "s" },
              { action = "LazyExtras",                                     desc = " Lazy Extras",     icon = " ", key = "x" },
              { action = "Lazy",                                           desc = " Lazy",            icon = "󰒲 ", key = "l" },
              { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ", key = "q" },
            },
            footer = function()
              local stats = require("lazy").stats()
              local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
              return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
            end,
          },
        }

        for _, button in ipairs(opts.config.center) do
          button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
          button.key_format = "  %s"
        end

        -- open dashboard after closing lazy
        if vim.o.filetype == "lazy" then
          vim.api.nvim_create_autocmd("WinClosed", {
            pattern = tostring(vim.api.nvim_get_current_win()),
            once = true,
            callback = function()
              vim.schedule(function()
                vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
              end)
            end,
          })
        end

        return opts
      end,
    },
  }
end
