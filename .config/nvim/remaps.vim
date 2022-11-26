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
nmap <leader>diary <leader>date :.r ~/notes/templates/diary.md<CR> 
nmap <leader>standup :r ~/notes/templates/standup.md<CR>
nmap <leader>tps :r ~/notes/templates/tps.md<CR>
nmap <leader>ntfe :r ~/notes/templates/note taking frontend.md<CR>

" Helpers
nmap <leader>date :put =strftime('# %a %b %d')<CR>

" { { File Explorer } }
" NerdTree
nnoremap <leader>jk :NvimTreeToggle<CR>
nnoremap <leader>jl :NvimTreeFindFile<CR>

" { { Lawrencium } }
nnoremap <leader>hg :Hgstatus<CR>

" Using lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fq <cmd>lua require('telescope.builtin').quickfix()<cr>
nnoremap <leader>fr <cmd>lua require('telescope.builtin').resume()<cr>

