return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- make sure mason installs the server
      servers = {
        biome = {},
      },
      setup = {},
      inlay_hints = { enabled = false },
    },
  },
}
