" TODO:
" Break out into multiple files (/sets.vim, /plugins.vim, /etc.vim)

"   { { Plugins } }
call plug#begin('~/.vim/plugged')
" TODO:
" Check out https://github.com/nvim-telescope/telescope.nvim over fzf
" Check out https://github.com/neovim/nvim-lspconfig over coc
" Check out https://github.com/nvim-treesitter/nvim-treesitter
" Check out https://github.com/mbbill/undotree (This bad boy looks cool)

" { { Themes } }
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'iCyMind/NeoSolarized'
Plug 'chuling/vim-equinusocio-material'
Plug 'gruvbox-community/gruvbox'

" { { Display colors } }
Plug 'ap/vim-css-color'
Plug 'chrisbra/Colorizer'

" { { Questionable, cursed plugins } }
" Neovim on Browser inputs
Plug 'glacambre/firenvim', { 'do': { _ -> firevim#install(0) } }

" { { Nerdtree } }
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" { { tComm, file type sensible comments } }
Plug 'tomtom/tcomment_vim'

" { { fzf Fuzzy find: a general-purpose command-line fuzzy finder } }
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" { { YEEZY YEEZY WATS GOOD, Silver Searcher in the flesh, the official wave searcher } }
" Plug 'rking/ag.vim'

" { { TPOPE IS MY HERO } }
" Vim casing/working with variants of a word. Mainly for coercion (cr[case])
" commented out in favor of vim-caser, since it has visual mode support
" Plug 'tpope/vim-abolish'
" Surround in parens/quotes/XML
" NOTE: use: cs"' to change " to '
" NOTE: use ds" to delete surrounding "
Plug 'tpope/vim-surround'
" { { Git integration use :Git/:G for commands } }
Plug 'tpope/vim-fugitive'

" { { Git Gutter } }
Plug 'airblade/vim-gitgutter'

" { { Better vim casing (includes motion, visual mode, and object support) } }
" NOTE: use: gs{motion} to change case for a visual selection
Plug 'arthurxavierx/vim-caser'

" { { Conquer of Completion 'Make your Vim/Neovim as smart as VSCode.' } }
" Use release branch (Recommend)
" Settings in coc-settings.json
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" { { Better syntax highlighting } }
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'pangloss/vim-javascript'
Plug 'jparise/vim-graphql'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'lepture/vim-jinja'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" { { VimWiki  } }
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'mattn/calendar-vim'

" { { Vim Org Mode } }
Plug 'jceb/vim-orgmode'

" { { Auto close brackets/quotes } }
Plug 'jiangmiao/auto-pairs'

" Plug 'vim-airline/vim-airline' 
Plug 'itchyny/lightline.vim'

" { { Vim devicons } } 
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
call plug#end()

" Shortcut to format json :FormatJSON
com! FormatJSON %!python -m json.tool

" { { THEME OPTIONS } }
set termguicolors  " NeoSolarized requirement
color gruvbox " Color scheme
set encoding=UTF-8 " Setting for vim-devicons

"
" ======= VIM OPTIONS =======
"
filetype plugin indent on           " allows auto-indenting depending on file type
runtime macros/matchit.vim          " Enhances '%' functionality to jump to matching brackets/tags
set autoindent                      " indent a new line the same amount as the line just typed
set clipboard+=unnamedplus          " ALWAYS use system clipboard
set directory^=~/.config/nvim/swap/ " Swap file directory
set expandtab                       " converts tabs to white space
set foldmethod=indent
set nofoldenable
set hlsearch                        " highlight search results
set ignorecase                      " case insensitive matching
set inccommand=nosplit              " live edit search/replace
set mouse=a                         " Enable mouse... Yes, I did it.
set noswapfile                      " swapfiles have become a pain, and get in the way more often than I use them
set number                          " add line numbers
set scrolloff=8                     " scroll before hitting the bottom of a page
set shiftwidth=2                    " width for autoindents
set showmatch matchtime=3           " show matching brackets.
set softtabstop=2                   " see multiple spaces as tabstops so <BS> does the right thing
set splitbelow splitright           " Open splits in the expected place
set tabstop=2                       " number of columns occupied by a tab character
set wildmode=longest,list           " get bash-like tab completions

" TODO/TO ADD:
" These are based off Mr. ThePrimeagen's 2021 vimrc video  https://www.youtube.com/watch?v=DogKdiRx7ls
" set undodir=~/.vim/undodir " Check this one out, on the fence about it

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

"
" ======= PLUGIN OPTIONS =======
"
" { { DevIcons settings } }
let g:webdevicons_conceal_nerdtree_brackets = 1               
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true

" { { NERDTREE OPTIONS } }
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
augroup NerdTree
  autocmd! 
  autocmd StdinReadPre * let s:std_in=1
augroup END

" { { Firenvim } }
au BufEnter github.com_*.txt set filetype=markdown
let g:firenvim_config = { 
    \ 'globalSettings': {
        \ 'alt': 'all',
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'content': 'text',
            \ 'priority': 0,
            \ 'selector': 'textarea',
            \ 'takeover': 'never',
        \ },
    \ }
\ }

" { { Lightline } }
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'absolutepath', 'modified' ] ],
      \ }
      \ }

" { { VimWiki } }
" All notes saved as markdown
let g:vimwiki_list = [{ 
      \ 'path': '~/notes/',
      \ 'syntax':'markdown', 
      \ 'folding':'syntax',
      \ 'ext': '.md' }]
let g:vimwiki_folding='custom'
" { { Notes Temmplates } }
" Copy content of template to file
nmap <leader>notes :r ~/notes/templates/notes.md<CR>
nmap <leader>diary :.r ~/notes/templates/diary.md<CR> <leader>date
nmap <leader>standup :r ~/notes/templates/standup.md<CR>
nmap <leader>int :r ~/notes/templates/interview.md<CR>
" Helpers
nmap <leader>date :put =strftime('# %a %b %d')<CR>

" " { { Silver Surfer } }
" nnoremap \ :Ag<SPACE>
" " Use Ag over grep
" set grepprg=ag\ --nogroup\ --nocolor
" " FZF view
" command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--color-path "1;36"', fzf#vim#with_preview(), <bang>0)

" { { Ripgrep LET IT RIIIIIPPPPPPPPPP } }
nnoremap \ :Rg<SPACE>
" Tell FZF to use RG - so we can skip .gitignore files even if not using
" :GitFiles search
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
" If you want gitignored files:
"let $FZF_DEFAULT_COMMAND = 'rg --files --no-ignore-vcs --hidden'

" { { FZF } }
" ctrl+p remap ctrl+a to search from source
noremap <C-a> :Files ~/source/
nnoremap <silent> <C-p> :Files<CR>

" { { COC.NVIM CONFIGS: } }
" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

augroup CoCGroup 
  autocmd!
  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" { { Reload nerdtree icons (fixes brackets showing after resourcing) } }
if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif
let g:coc_global_extension = [
                \'coc-eslint',
                \'coc-json',
                \'coc-pairs',
                \'coc-prettier'
\]
"let g:prettier#config#config_precedence = 'file-override'
command! -nargs=0 Prettier :CocCommand prettier.formatFile
xmap <leader>p :Prettier<CR>
nmap <leader>p :Prettier<CR>

