--
---- Load options
require("artilheiro.options")

-- Load key mappings
require("artilheiro.remap")


-- Enable 24-bit color support (important for rose-pine)
vim.o.termguicolors = true

--- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- Latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("artilheiro.lazy")

-- Load plugins (e.g. rose-pine, telescope)
--require("artilheiro.packer")


-- BuildiOS
vim.api.nvim_create_user_command("BuildiOS", function()
  require("artilheiro.ios").build_and_run()
end, {})



-- Optional: simple test to confirm init.lua is running
print("hello from init.lua")

