return {
  {
    "vhyrro/luarocks.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-neotest/nvim-nio",
      "nvim-neorg/lua-utils.nvim",
      "nvim-lua/plenary.nvim",
    },
    priority = 1000, -- We'd like this plugin to load first out of the rest
    config = true, -- This automatically runs `require("luarocks-nvim").setup()`
  },
}
