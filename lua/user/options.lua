-- Neovim configuration script for displaying special characters

local set = vim.opt  -- Reference to Neovim options table

set.list = true  -- Enable display of special characters

-- Configure display of special characters:
set.listchars = { tab = '»·', trail = '·', extends = '→', precedes = '←' }

-- Enable formatting concealment features
set.conceallevel = 2
