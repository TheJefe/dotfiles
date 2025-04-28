-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Map an easier escape
vim.keymap.set("i", "jj", "<ESC>", { silent = true, desc = "Exit insert mode with jj" })

-- Map an easier save
vim.keymap.set("n", "ss", ":write<CR>", { silent = true, desc = "save with ss" })
