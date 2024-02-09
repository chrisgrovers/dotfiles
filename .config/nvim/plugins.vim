"
" ======= PLUGINS =======
"
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
" == potential add on plugins ==
" https://github.com/ahmedkhalf/project.nvim
" Check out https://github.com/mbbill/undotree (This bad boy looks cool)
" === INSPIRATION ===
" == Primeagen dots ==
" https://github.com/awesome-streamers/awesome-streamerrc
" == Nice aesthetic dots for inspo ==
" https://github.com/NvChad/NvChad
" == for when I have nothing better to do ==
" https://github.com/rockerBOO/awesome-neovim

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
Plug 'nvim-telescope/telescope-live-grep-args.nvim'

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
Plug 'tpope/vim-abolish'

" { { VERSION CONTROL } }
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
Plug 'lukas-reineke/indent-blankline.nvim'

" { { VimWiki  } }
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'mattn/calendar-vim'

" { { Auto close brackets/quotes } }
Plug 'hoob3rt/lualine.nvim'

" Initialize plugin system
call plug#end()
