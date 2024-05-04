return {
  {
    "rcarriga/nvim-notify",
    opts = function(_, opts)
      if not opts.timeout then
        opts.timeout = 1000
      end
      if not opts.background_colour then
        opts.background_colour = "#282828"
      end
    end,
  },
  {
    "rebelot/heirline.nvim",
    dependencies = {
      {
        "Zeioth/heirline-components.nvim",
      }
    },
    opts = function(_, opts)
      -- list like portions of a table cannot be merged naturally and require the user to merge it manually
      -- check to make sure the key exists
      if not opts.statusline then
        opts.statusline = {}
      end
      local function insert_at(tbl, index, value)
          table.insert(tbl, index, value)
      end
      local heirline_components = require "heirline-components.all"
      local fileformat = function()
        local fmt = heirline_components.component.file_encoding({
          file_encoding = {
            padding = {
              left = 1,
              right = 0
            }
          },
          file_format = {
            padding = {
              left = 2,
              right = 0
            }
          }
        })
        return fmt
      end
      insert_at(opts.statusline, 10, {
        fileformat(),
      })
    end,
  },
}
