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
keymap.set("n", "<leader>tt", ":tabnew<CR>", { desc = "New tab" })           -- new tab
keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Close tab" })       -- close tab
keymap.set("n", "<leader>to", ":tabonly<CR>", { desc = "Close other tabs" }) -- close others
keymap.set("n", "<leader>tn", ":tabnext<CR>", { desc = "Next tab" })         -- next tab
keymap.set("n", "<leader>tp", ":tabprevious<CR>", { desc = "Previous tab" }) -- prev tab
keymap.set("n", "<leader>tm", ":tabmove<CR>", { desc = "Move tab" })         -- move tab
