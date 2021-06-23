" 
" ======== REMAP KEYS ========
"
" { { Leader key } }

let mapleader =" "

" { { Ez access to settings } }

nnoremap <Leader>, :e $MYVIMRC<cr>

" { { Split Navigation shortcuts } }

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" { { For simple sizing of splits. } }

map <silent> <C-Down> <C-W>5-
map <silent> <C-Up> <C-W>5+
map <silent> <C-Right> <C-W>5>
map <silent> <C-Left> <C-W>5<

" { { Reload settings without closing } }
nnoremap <Leader>r :so $MYVIMRC<CR>

" { { Notes Templates } }
"
" Copy content of template to file
nmap <leader>notes :r ~/notes/templates/notes.md<CR>
nmap <leader>diary :.r ~/notes/templates/diary.md<CR> <leader>date
nmap <leader>standup :r ~/notes/templates/standup.md<CR>
" TODO: Update the interview/code review shortcut
nmap <leader>int :r ~/notes/templates/interview.md<CR>
" Helpers
nmap <leader>date :put =strftime('# %a %b %d')<CR>

" { { Compe } }
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" { { Telescope } }
" Copy/pasted from the README
" https://github.com/nvim-telescope/telescope.nvim#usage

" Find files using Telescope command-line sugar.
" nnoremap <leader>ff <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
