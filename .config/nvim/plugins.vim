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

" { { Display colors } }
Plug 'ap/vim-css-color'
Plug 'chrisbra/Colorizer'

" { { Nvim-tree } }
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

" { { Clipboard anywhere?? } }
Plug 'ojroques/vim-oscyank'

" { { Telescope } }
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" { { Nvim-autopairs } }
Plug 'windwp/nvim-autopairs'

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
Plug 'hoob3rt/lualine.nvim'

" { { Vim devicons } } 
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
call plug#end()
