-- { { GLOBAL SETTINGS } }
vim.g.mapleader = " "

local opt = vim.opt
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.autoindent = true
opt.clipboard = "unnamedplus"
opt.colorcolumn = "80"
opt.directory:prepend("~/.config/nvim/swap/")
opt.expandtab = true
opt.foldmethod = "indent"
opt.foldenable = false
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "nosplit"
opt.mouse = "a"
opt.swapfile = false
opt.scrolloff = 8
opt.shiftwidth = 2
opt.linebreak = true
opt.showmatch = true
opt.matchtime = 3
opt.softtabstop = 2
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 2
opt.wildmode = "longest:list"
opt.completeopt = { "menu", "menuone", "noselect" }
opt.laststatus = 1
opt.showbreak = "↪  "
opt.list = true
opt.listchars = { tab = "→ ", nbsp = "␣", trail = "•", extends = "⟩", precedes = "⟨" }
opt.conceallevel = 2

vim.cmd("filetype plugin indent on")
vim.cmd("runtime macros/matchit.vim")

-- { { BOOTSTRAP LAZY.NVIM } }
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

-- { { GLOBAL REMAPS } }
require('remaps')

-- { { THEME } }
vim.cmd.colorscheme("catppuccin-mocha")
