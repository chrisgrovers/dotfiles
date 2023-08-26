"
" ======= PLUGINS =======
"
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
" Pretty much copy what theprimeagen and altf4 stream are doing
" https://github.com/awesome-streamers/awesome-streamerrc

" { { Themes } }
Plug 'folke/tokyonight.nvim'

" { { Greeting Page } }
Plug 'goolord/alpha-nvim'
Plug 'MaximilianLloyd/ascii.nvim'
Plug 'MunifTanjim/nui.nvim'

" { { Display colors } }
Plug 'ap/vim-css-color'
Plug 'chrisbra/Colorizer'

" { { Nvim-tree } }
Plug 'nvim-tree/nvim-web-devicons' " for file icons
Plug 'nvim-tree/nvim-tree.lua'

" { { Telescope } }
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" { { Nvim-autopairs } }
Plug 'windwp/nvim-autopairs'

" { { Treesitter } }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'andymass/vim-matchup'

" { { tComm, file type sensible comments } }
Plug 'tomtom/tcomment_vim'

" { { YEEZY YEEZY WATS GOOD, Silver Searcher in the flesh, the official wave searcher } }
" Plug 'rking/ag.vim'

" { { TPOPE IS MY HERO } }
" Surround in parens/quotes/XML
Plug 'tpope/vim-surround'

" { { VERSION CONTROL } }
" { { Git/Mercurial}}
Plug 'ludovicchabant/vim-lawrencium'

" { { Git integration use :Git/:G for commands } }
Plug 'tpope/vim-fugitive'
Plug 'sindrets/diffview.nvim'

" { { Git Gutter } }
Plug 'mhinz/vim-signify'

" { { Better vim casing (includes motion, visual mode, and object support) } }
" NOTE: use: gs{motion} to change case for a visual selection
Plug 'arthurxavierx/vim-caser'

" { { LSP Config } }
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'hrsh7th/cmp-nvim-lua'
Plug 'onsails/lspkind-nvim'
Plug 'folke/trouble.nvim'

" For vsnip users
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" { { Better syntax highlighting } }
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'lepture/vim-jinja'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" { { VimWiki  } }
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'mattn/calendar-vim'

" { { Auto close brackets/quotes } }
Plug 'hoob3rt/lualine.nvim'

" { { Vim devicons } } 
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
call plug#end()
