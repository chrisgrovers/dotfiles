"
" ======= PLUGINS =======
"
call plug#begin('~/.vim/plugged')
" TODO:
" Check out https://github.com/neovim/nvim-lspconfig over coc
  " Set up shortcuts/remaps
" Check out https://github.com/nvim-treesitter/nvim-treesitter
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
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" { { Telescope } }
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

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

" { { Git Gutter } }
Plug 'airblade/vim-gitgutter'

" { { Better vim casing (includes motion, visual mode, and object support) } }
" NOTE: use: gs{motion} to change case for a visual selection
Plug 'arthurxavierx/vim-caser'

" { { Conquer of Completion 'Make your Vim/Neovim as smart as VSCode.' } }
" Use release branch (Recommend)
" Settings in coc-settings.json
" TODO: Remove coc.nvim if nvim-lspconfig is good
" The coc has served me well. You'll stay here for a while as a comment :')
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

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
