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
  }
}
