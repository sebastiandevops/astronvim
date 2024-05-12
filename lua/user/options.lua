-- Neovim configuration script for displaying special characters

local set = vim.opt  -- Reference to Neovim options table

set.list = true  -- Enable display of special characters

-- Configure display of special characters:
set.listchars = {
  space = '⋅',
  eol = '¶',
  tab = '⇢ ',
  trail = '·',
  extends = '→',
  precedes = '←'
}

set.conceallevel = 2                        -- Enable formatting concealment features
set.fillchars = { eob = " ", vert = " " }   -- Set the fill characters for end of buffer and vertical split to be a space
set.expandtab = true                        -- convert tabs to spaces
set.shiftwidth = 2                          -- the number of spaces inserted for each indentation
set.tabstop = 2                             -- insert 2 spaces for a tab
