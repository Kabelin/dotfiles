return {
  -- add auto_install
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.auto_install = true
    end,
  },
}
