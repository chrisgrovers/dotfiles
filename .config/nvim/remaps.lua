-- ======== REMAP KEYS ========
--
-- { { Leader key } }

vim.g.mapleader = " "

-- { { Ez access to settings } }

vim.api.nvim_set_keymap('n', '<Leader>,', ':e $MYVIMRC<CR>', { noremap = true })

-- { { Split Navigation shortcuts } }

vim.api.nvim_set_keymap('n', '<C-J>', '<C-W><C-J>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W><C-K>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W><C-L>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-H>', '<C-W><C-H>', { noremap = true })

-- { { For simple sizing of splits. } }

vim.api.nvim_set_keymap('n', '<C-Down>', '<C-W>5-', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Up>', '<C-W>5+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Right>', '<C-W>5>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Left>', '<C-W>5<', { noremap = true, silent = true })

-- { { Reload settings without closing } }
vim.api.nvim_set_keymap('n', '<Leader>r', ':so $MYVIMRC<CR>', { noremap = true })

-- { { Notes Templates } }
--
-- Copy content of template to file
vim.api.nvim_set_keymap('n', '<Leader>notes', ':r ~/notes/templates/notes.md<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>diary', ':.r ~/notes/templates/diary.md<CR> <Leader>date', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>standup', ':r ~/notes/templates/standup.md<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>tps', ':r ~/notes/templates/tps.md<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>ntfe', ':r ~/notes/templates/note taking frontend.md<CR>', { noremap = true })

-- Helpers
vim.api.nvim_set_keymap('n', '<Leader>date', ':put =strftime(\'# %a %b %d\')<CR>', { noremap = true })

-- { { File Explorer } }
-- NvimTree
vim.api.nvim_set_keymap('n', '<Leader>jk', ':NvimTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>jl', ':NvimTreeFindFile<CR>', { noremap = true })

-- { { Lawrencium } }
vim.api.nvim_set_keymap('n', '<Leader>hg', ':Hgstatus<CR>', { noremap = true })

-- { { Telescope } }
-- Copy/pasted from the README
-- https://github.com/nvim-telescope/telescope.nvim#usage

-- Find files using Telescope command-line sugar.
-- Using lua functions
vim.api.nvim_set_keymap('n', '<Leader>ff', '<cmd>lua require(\'telescope.builtin\').find_files()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fg', '<cmd>lua require(\'telescope.builtin\').live_grep()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fb', '<cmd>lua require(\'telescope.builtin\').buffers()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fh', '<cmd>lua require(\'telescope.builtin\').help_tags()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fq', '<cmd>lua require(\'telescope.builtin\').quickfix()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fr', '<cmd>lua require(\'telescope.builtin\').resume()<CR>', { noremap = true })

-- Vim-oscyank
vim.api.nvim_set_keymap('n', '<Leader>y', '<Plug>OSCYankOperator', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>yy', '<Leader>y_', { noremap = true })
vim.api.nvim_set_keymap('v', '<Leader>y', '<Plug>OSCYankVisual', { noremap = true })


