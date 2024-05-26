return {
  "TobinPalmer/rayso.nvim",
  cmd = "Rayso",
  config = function()
    require("rayso").setup({
      open_cmd = "firefox-developer-edition",
      base_url = "https://ray.so/",
      options = {
        logging_path = "/home/vitor/Documents/", -- Notices the trailing slash
        logging_file = "rayso",
        logging_enabled = false,
        theme = "midnight",
        background = true,
        dark_mode = true,
        title = "Untitled",
        padding = 16,
      },
    })
  end,
}
