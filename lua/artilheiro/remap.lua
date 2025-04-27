-- Set leader early
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- For cleaner syntax
local keymap = vim.keymap

-- File explorer (netrw)
keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open netrw file explorer" })

-- Window management
keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close current split" })


-- Tabs
vim.keymap.set('n', '<Tab>', ':bnext<CR>')
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>')
vim.keymap.set('n', '<leader>x', ':bdelete<CR>')  -- close buffer


-- Navigation 
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
