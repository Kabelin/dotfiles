local options = {
  linters_by_ft = {
    ["gitcommit"] = { "commitlint" },
    ["*"] = { "codespell" },
  },
}

return {
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = options,
  },
}
