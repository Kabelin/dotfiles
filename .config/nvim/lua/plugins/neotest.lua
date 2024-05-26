return {
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-jest",
      "thenbe/neotest-playwright",
      "rouge8/neotest-rust",
    },
    opts = {
      adapters = {
        ["neotest-python"] = {},
        ["neotest-jest"] = {
          jestCommand = "yarn test:light --",
          jestConfigFile = "jest.config.js",
          cwd = function()
            return vim.fn.getcwd()
          end,
          jest_test_discovery = true,
          discovery = {
            enabled = false,
          },
        },
        ["neotest-playwright"] = {},
        ["neotest-rust"] = {},
      },
    },
  },
}
