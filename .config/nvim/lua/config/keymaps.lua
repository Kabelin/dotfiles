-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
-- map(
--   { "n", "t" },
--   "<leader>e",
--   "<Cmd>NnnExplorer %:p:h<CR>",
--   { desc = "Toggle NNN explorer (active buffer)", silent = true }
-- )
-- map({ "n", "t" }, "<leader>E", "<Cmd>NnnExplorer", { desc = "Toggle NNN explorer (cwd)", silent = true })
-- map(
--   { "n", "t" },
--   "<leader>p",
--   "<Cmd>NnnPicker %:p:h<CR>",
--   { desc = "Toggle NNN picker (active buffer)", silent = true }
-- )
-- map({ "n", "t" }, "<leader>P", "<Cmd>NnnPicker", { desc = "Toggle NNN picker (cwd)", silent = true })
-- map({ "v" }, "<leader>r", require("lib.create").create_snippet, { desc = "Create code snippet", silent = true })

-- Seamless navigation
map({ "n" }, "<C-j>", "<Cmd>KittyNavigateDown<CR>", { desc = "Move to down window", noremap = true, silent = true })
map({ "n" }, "<C-k>", "<Cmd>KittyNavigateTop<CR>", { desc = "Move to top window", noremap = true, silent = true })
map({ "n" }, "<C-h>", "<Cmd>KittyNavigateLeft<CR>", { desc = "Move to left window", noremap = true, silent = true })
map({ "n" }, "<C-l>", "<Cmd>KittyNavigateRight<CR>", { desc = "Move to right window", noremap = true, silent = true })
