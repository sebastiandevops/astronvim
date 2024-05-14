return {
  {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      { "kkharji/sqlite.lua", module = "sqlite" },
      -- you'll need at least one of these
      { "nvim-telescope/telescope.nvim" },
      { "ibhagwan/fzf-lua" },
    },
    config = function()
      require("neoclip").setup {
        history = 100,
        enable_persistent_history = true,
        continuous_sync = true,
      }
    end,
    keys = {
      {
        "<leader>Tn",
        ":Telescope neoclip<CR>",
        mode = "n",
        desc = "Open neoclip history",
      },
    },
  },
}
