return {
  "rose-pine/neovim",
  name = "rose-pine",
  opts = function(_, opts)
    opts.variant = "auto"
    opts.styles = {
      italic = false,
      transparency = true
    }
  end
}
