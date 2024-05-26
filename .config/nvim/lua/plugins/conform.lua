local biome_fts = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json", "jsonc" }

local markdown_fts = { "markdown", "gitcommit" }

local options = {
  formatters_by_ft = {
    ["*"] = { "codespell" },
  },
}

for _, ft in ipairs(biome_fts) do
  options.formatters_by_ft[ft] = { "biome" }
end

for _, ft in ipairs(markdown_fts) do
  options.formatters_by_ft[ft] = { "markdownlint" }
end

return {
  -- add formatters
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = options,
  },
}
