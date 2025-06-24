-- ======== REMAP KEYS ========
--
-- { { Leader key } }

vim.g.mapleader = " "

-- { { Ez access to settings } }

vim.keymap.set('n', '<Leader>,', ':e $MYVIMRC<CR>', { noremap = true })

-- { { Split Navigation shortcuts } }

vim.keymap.set('n', '<C-J>', '<C-W><C-J>', { noremap = true })
vim.keymap.set('n', '<C-K>', '<C-W><C-K>', { noremap = true })
vim.keymap.set('n', '<C-L>', '<C-W><C-L>', { noremap = true })
vim.keymap.set('n', '<C-H>', '<C-W><C-H>', { noremap = true })

-- { { For simple sizing of splits. } }

-- vim.keymap.set('n', '<C-Down>', '<C-W>5-', { noremap = true, silent = true })
-- vim.keymap.set('n', '<C-Up>', '<C-W>5+', { noremap = true, silent = true })
-- vim.keymap.set('n', '<C-Right>', '<C-W>5>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<C-Left>', '<C-W>5<', { noremap = true, silent = true })

-- vim.keymap.set('n', '<C-Down>', ':VimwikiDiaryPrevDay', { noremap = true, silent = true })
-- vim.keymap.set('n', '<C-Up>', 'VimwikiDiaryNextDay', { noremap = true, silent = true })

-- { { Reload settings without closing } }
vim.keymap.set('n', '<Leader>r', ':so $MYVIMRC<CR>', { noremap = true })

-- { { Notes Templates } }
--
-- Copy content of template to file
vim.keymap.set('n', '<Leader>notes', ':r ~/notes/templates/notes.md<CR>', { noremap = true })
vim.keymap.set('n', '<Leader>diary', ':put =strftime(\'# %a %b %d, %Y\')<CR> <BAR> :r ~/notes/templates/diary.md<CR>', { noremap = true })
-- TODO Convert to vim.cmd
-- vim.keymap.set('n', '<Leader>notes', function() vim.cmd(':r ~/notes/templates/notes.md<CR>') end, { noremap = true })
-- vim.keymap.set('n', '<Leader>diary', function() vim.cmd(':r ~/notes/templates/diary.md<CR> <Leader>date') end, { noremap = true })

-- Helpers
vim.keymap.set('n', '<Leader>date', ':put =strftime(\'# %a %b %d\')<CR>', { noremap = true })

-- { { File Explorer } }
-- NvimTree
vim.keymap.set('n', '<Leader>jk', ':NvimTreeToggle<CR>', { noremap = true })
vim.keymap.set('n', '<Leader>jl', ':NvimTreeFindFile<CR>', { noremap = true })

-- { { Lawrencium } }
vim.keymap.set('n', '<Leader>hg', ':Hgstatus<CR>', { noremap = true })

-- { { Telescope } }
-- Copy/pasted from the README
-- https://github.com/nvim-telescope/telescope.nvim#usage

-- Find files using Telescope command-line sugar.
-- Using lua functions
vim.keymap.set('n', '<Leader>ff', '<cmd>lua require(\'telescope.builtin\').find_files()<CR>', { noremap = true })
vim.keymap.set('n', '<Leader>fg', '<cmd>lua require(\'telescope.builtin\').live_grep()<CR>', { noremap = true })
vim.keymap.set('n', '<Leader>fb', '<cmd>lua require(\'telescope.builtin\').buffers()<CR>', { noremap = true })
vim.keymap.set('n', '<Leader>fh', '<cmd>lua require(\'telescope.builtin\').help_tags()<CR>', { noremap = true })
vim.keymap.set('n', '<Leader>fq', '<cmd>lua require(\'telescope.builtin\').quickfix()<CR>', { noremap = true })
vim.keymap.set('n', '<Leader>fr', '<cmd>lua require(\'telescope.builtin\').resume()<CR>', { noremap = true })
vim.keymap.set('n', '<Leader>?', '<cmd>lua require(\'telescope.builtin\').keymaps()<CR>', { noremap = true })

-- Vim-oscyank
vim.keymap.set('n', '<Leader>y', '<Plug>OSCYankOperator', { noremap = true })
vim.keymap.set('n', '<Leader>yy', '<Leader>y_', { noremap = true })
vim.keymap.set('v', '<Leader>y', '<Plug>OSCYankVisual', { noremap = true })

-- { { Navigation } }
vim.keymap.set('n', '[b', '<cmd>bprevious<cr>', { noremap = true })
vim.keymap.set('n', ']b', '<cmd>bnext<cr>', { noremap = true })

-- { { Move highlighted lines } }
vim.api.nvim_set_keymap('v', '<S-J>', ':m \'>+1<CR>gv', { silent = true })
vim.api.nvim_set_keymap('v', '<S-K>', ':m \'<-2<CR>gv', { silent = true })
vim.api.nvim_set_keymap('v', '<', '<gv', { silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { silent = true })

