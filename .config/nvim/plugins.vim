"
" ======= PLUGINS =======
"
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


" { { Telescope } }
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

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
" { { Git integration use :Git/:G for commands } }
Plug 'tpope/vim-fugitive'

" { { Git Signs } }
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'

" { { Better vim casing (includes motion, visual mode, and object support) } }
" NOTE: use: gs{motion} to change case for a visual selection
Plug 'arthurxavierx/vim-caser'

" { { Conquer of Completion 'Make your Vim/Neovim as smart as VSCode.' } }
" Use release branch (Recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'ray-x/lsp_signature.nvim'

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
