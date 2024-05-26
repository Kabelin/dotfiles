return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      -- Disable clock
      table.remove(opts.sections.lualine_z, 1)
    end,
  },
}
