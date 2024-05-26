-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local biome_fts = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json", "jsonc" }
local json_config_files = { ".swcrc" }

-- Disable autoformat for biome formatter files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = biome_fts,
  callback = function()
    vim.b.autoformat = false
  end,
})

-- File type detection
-- config files as json
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = json_config_files,
  callback = function()
    vim.bo.filetype = "json"
  end,
})
