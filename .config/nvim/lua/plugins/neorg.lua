return {
  -- {
  --   "folke/which-key.nvim",
  --   optional = true,
  --   opts = {
  --     defaults = {
  --       ["<leader>n"] = { name = "+neorg" },
  --     },
  --   },
  -- },
  --
  {
    "nvim-neorg/neorg",
    dependencies = { "nvim-lua/plenary.nvim", "luarocks.nvim" },
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {
            config = {
              icon_preset = "diamond",
            },
          }, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/Documents/notes",
                courses = "~/Documents/courses",
                scratchpad = "~/Documents/scratchpad",
              },
              default_workspace = "scratchpad",
            },
          },
        },
      })
    end,
    keys = {
      {
        "<leader>n",
        "<Cmd>Neorg<CR>",
        mode = "n",
        desc = "Open neorg",
      },
    },
  },
}
