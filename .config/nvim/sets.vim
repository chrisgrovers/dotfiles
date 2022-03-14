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
set linebreak                       " 
set showmatch matchtime=3           " show matching brackets.
set softtabstop=2                   " see multiple spaces as tabstops so <BS> does the right thing
set splitbelow splitright           " Open splits in the expected place
set tabstop=2                       " number of columns occupied by a tab character
set wildmode=longest,list           " get bash-like tab completions
"
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
