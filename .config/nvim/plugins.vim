"
" ======= PLUGINS =======
"
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
" TODO:
  " Set up shortcuts/remaps
" Check out https://github.com/mbbill/undotree (This bad boy looks cool)
" ^^^ Pretty much copy what theprimeagen and altf4 stream are doing
" https://github.com/awesome-streamers/awesome-streamerrc

" { { Themes } }
" TLDR: Setting up solarized takes effort, and I'm lazy
Plug 'gruvbox-community/gruvbox'

" { { Display colors } }
Plug 'ap/vim-css-color'
Plug 'chrisbra/Colorizer'

" { { Nerdtree } }
" Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" { { Nvim-tree } }
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

" { { Clipboard anywhere?? } }
Plug 'ojroques/vim-oscyank'

" { { Telescope } }
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'


" { { G thangs}}
Plug 'sso://user/vintharas/telescope-codesearch.nvim'

" { { Nvim-autopairs } }
Plug 'windwp/nvim-autopairs'

" { { Prettier } }
" Plug 'sbdchd/neoformat'
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" { { Treesitter } }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" { { tComm, file type sensible comments } }
Plug 'tomtom/tcomment_vim'

" { { YEEZY YEEZY WATS GOOD, Silver Searcher in the flesh, the official wave searcher } }
" Plug 'rking/ag.vim'

" { { TPOPE IS MY HERO } }
" Surround in parens/quotes/XML
Plug 'tpope/vim-surround'
" { { Git/Mercurial}}
Plug 'ludovicchabant/vim-lawrencium'

" { { Git Gutter } }
Plug 'mhinz/vim-signify'

" { { Better vim casing (includes motion, visual mode, and object support) } }
" NOTE: use: gs{motion} to change case for a visual selection
Plug 'arthurxavierx/vim-caser'

" { { Conquer of Completion 'Make your Vim/Neovim as smart as VSCode.' } }
" Use release branch (Recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prabirshrestha/vim-lsp'
Plug 'neovim/nvim-lspconfig'

" { { Better syntax highlighting } }
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'lepture/vim-jinja'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'yamatsum/nvim-cursorline'

" { { VimWiki  } }
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'mattn/calendar-vim'

" { { Auto close brackets/quotes } }
" TODO: @chris nvim-autopairs should be the one. Remove
" Plug 'jiangmiao/auto-pairs'

" Plug 'vim-airline/vim-airline' 
" Plug 'itchyny/lightline.vim'
Plug 'hoob3rt/lualine.nvim'

" { { Vim devicons } } 
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
call plug#end()
