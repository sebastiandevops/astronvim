return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = function(_, opts)
      opts.transparent = true
      opts.theme = "wave"          -- Load "wave" theme when 'background' option is not set
      opts.background = {          -- map the value of 'background' option to a theme
          dark = "wave",           -- try "dragon" !
          light = "lotus"
      }
      opts.colors = {
        theme = {
          all = {
            ui = {
              bg = "none",
              bg_gutter = "none",
              float = {
                bg = "none",
                bg_border = "none",
              }
            }
          }
        }
      }
      opts.overrides = function()
        return {
          StatusLine = {
            bg = "none"
          },
          -- Group colors for NeoTree window border
          WinSeparator = {
            fg = "none"
          },
          -- Group colors for NeoTree inactive tab
          TabLine = {
            bg = "none",
            fg = "#736a99"
          },
          -- Group colors for NeoTree selected tab
          TabLineSel = {
            bg = "none",
            bold = true,
          }
        }
      end
    end
  }
}
