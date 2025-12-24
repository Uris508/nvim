return
{
  'mistweaverco/snap.nvim',
  -- version = '1.2.1',
  opts = {
    debug = {
      backend = "bun",         -- Debug backend to use (currently only "bun" is supported)
      log_level = "info",      -- Log level for debugging (e.g., "info", "debug", "error")
    },
    timeout = 5000, -- Timeout for screenshot command in milliseconds
    template = "default", -- Template to use for rendering screenshots (currently only "default" is supported)
    templateFilepath = nil, -- Absolute path to a custom handlebars template file (optional), overrides 'template' option
    -- Additional data to pass to the your custom handlebars template (optional)
    additional_template_data = {
      author = "Uris Cheng",
      website = "https://www.inventec.com",
    },
    output_dir = "t:/CodeSnap", -- Directory to save screenshots
    filename_pattern = "snap.nvim_%t", -- e.g., "snap.nvim_%t" (supports %t for timestamp)
    copy_to_clipboard = {
        image = true, -- Whether to copy the image to clipboard
        html = true, -- Whether to copy the HTML to clipboard
    },
    font_settings = {
      size = 14,         -- Default font size for the screenshot
      line_height = 0.7, -- Default line height for the screenshot
      default = {
        name = "Terminess Nerd Font", -- Default font name for the screenshot
        file = nil,         -- Absolute path to a custom font file (.ttf) (optional)
        -- Only needed if the font is not installed system-wide
        -- or if you want to export as HTML with the font embedded
        -- so you can view it correctly in E-mails or browsers
      },
      -- Optional font settings for different text styles (bold, italic, bold_italic)
      bold = {
        name = "Terminess Nerd Font", -- Font name for bold text
        file = nil,         -- Absolute path to a custom font file (.ttf) (optional)
        -- Only needed if the font is not installed system-wide
        -- or if you want to export as HTML with the font embedded
        -- so you can view it correctly in E-mails or browsers
      },
      italic = {
        name = "IosevkaTerm Nerd Font", -- Font name for italic text
        file = nil,         -- Absolute path to a custom font file (.ttf) (optional)
        -- Only needed if the font is not installed system-wide
        -- or if you want to export as HTML with the font embedded
        -- so you can view it correctly in E-mails or browsers
      },
      bold_italic = {
        name = "Terminess Nerd Font", -- Font name for bold and italic text
        file = nil,         -- Absolute path to a custom font file (.ttf) (optional)
        -- Only needed if the font is not installed system-wide
        -- or if you want to export as HTML with the font embedded
        -- so you can view it correctly in E-mails or browsers
      },
    },
  },
  -- defaults to nil
  -- if set, no pre-compiled binaries will be downloaded
  -- and the plugin will attempt to run directly from source
}
