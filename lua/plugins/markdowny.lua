return {
  {
    'sebastiandevops/markdowny.nvim',
    config = function()
        require('markdowny').setup({
        filetypes = { "markdown", "txt" }
      })
    end
  }
}
