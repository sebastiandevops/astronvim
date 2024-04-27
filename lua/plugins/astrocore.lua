-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = false, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = true, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs with `H` and `L`
        L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
        -- Resize with arrows
        ["<C-S-Left>"] = { ":vertical resize -2<CR>", desc = "Resize buffer left" },
        ["<C-S-Right>"] = { ":vertical resize +2<CR>", desc = "Resize buffer right" },
        -- Search & Replace
        -- <C-s> will replace the current word under the cursor and send the word to search registers, so I can press n to search for the next word and press . to repeat the changes.
        ["<C-s>"] = {
          function()
            vim.api.nvim_command 'norm! yiw'
            vim.fn.setreg('/', vim.fn.getreg '+')
            vim.api.nvim_feedkeys('ciw', 'n', false)
          end,
          desc = 'Search & Replace'
        },
        -- Delete ending whitespace
        ["ge"] = {
          function()
            -- Save the current cursor position
            local current_position = vim.fn.getpos(".")
            -- Store the last search pattern
            local reg = vim.fn.getreg("/")
            -- Perform the whitespace removal using a global substitute command
            vim.cmd("%s/\\s*$//g")
            -- Restore the search pattern
            vim.fn.setreg("/", reg)
            -- Restore the cursor position
            vim.fn.setpos(".", current_position)
          end,
          desc = "Delete ending whitespace"
          },
          -- move lines up and down
          ["<A-j>"] = {":m .+1<CR>==", desc = "Move line down"},
          ["<A-k>"] = {":m .-2<CR>==", desc = "Move line up"},
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
      v = {
        -- Stay in indent mode
        ["<"] = { "<gv", desc = "Shift left" },
        [">"] = { ">gv", desc = "Shift right" },
        -- Press <C-s> in visual mode will do the same but replace and search the current visual area.
        ["<C-s>"] = {[[y/\V<C-R>=escape(@",'/\')<CR><CR>Ncgn]]},
        -- move lines up and down
        ["<A-j>"] = {":m '>+1<CR>gv=gv", desc = "move line up" },
        ["<A-k>"] = {":m '<-2<CR>gv=gv", desc = "move line down" },
      },
      -- redirect to a popup focused window the messages generated by a command
      c = {
        ["<S-Enter>"] = {
          function()
            require("noice").redirect(vim.fn.getcmdline())
          end,
          desc = "Redirect Cmdline"
        }
      }
    },
  },
}
