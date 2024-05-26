return {
  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      local ensure_installed = {
        "commitlint",
        "codespell",
        "biome",
      }

      opts.ensure_installed = opts.ensure_installed or {}

      for _, v in ipairs(ensure_installed) do
        table.insert(opts.ensure_installed, v)
      end
    end,
  },
}
