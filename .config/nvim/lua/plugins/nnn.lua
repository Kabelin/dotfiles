return {
  {
    "luukvbaal/nnn.nvim",
    -- cmd = { "NnnExplorer", "NnnPicker" },
    config = function(_, opts)
      require("nnn").setup(opts)
    end,

    opts = {
      picker = {
        cmd = "nnn -AcHr", -- command override (-p flag is implied)
        -- cmd = "tmux new-session -s 'nnn-picker' nnn -AcHr", -- command override (-p flag is implied)
        style = {
          width = 0.7, -- percentage relative to terminal size when < 1, absolute otherwise
          height = 0.6, -- ^
          xoffset = 0.5, -- ^
          yoffset = 0.5, -- ^
          border = "rounded", -- border decoration for example "rounded"(:h nvim_open_win)
        },
        session = "local", -- or "global" / "local" / "shared"
        tabs = false, -- separate nnn instance per tab
        fullscreen = false, -- whether to fullscreen picker window when current tab is empty
      },
      auto_close = true, -- close tabpage/nvim when nnn is last window
      offset = true,
    },
    keys = {
      {
        "<leader>e",
        "<Cmd>NnnPicker %:p:h<CR>",
        mode = { "n", "t" },
        desc = "Toggle NNN (active buffer)",
      },
      {
        "<leader>r",
        "<Cmd>NnnPicker<CR>",
        mode = { "n", "t" },
        desc = "Toggle NNN (cwd)",
      },
    },
  },
}
