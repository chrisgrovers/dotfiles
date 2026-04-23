-- { { GLOBAL SETTINGS } }
vim.g.mapleader = " "
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- { { INITIALIZE PLUGINS } }
require("lazy").setup("plugins", {
  rocks = {
    enabled = false,
    hererocks = false,
  },
})

-- { { GLOBAL SETTINGS } }
local function source_vim(file)
    vim.cmd('source ' .. vim.fn.stdpath('config') .. '/' .. file)
end

source_vim('sets.vim')
require('remaps')

-- { { THEME } }
vim.cmd.colorscheme("catppuccin-mocha")
