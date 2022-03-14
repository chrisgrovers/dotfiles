" INSPIRATION:
" https://blog.inkdrop.app/how-to-set-up-neovim-0-5-modern-plugins-lsp-treesitter-etc-542c3d9c9887

source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/plugin-config.vim
source $HOME/.config/nvim/sets.vim
source $HOME/.config/nvim/remaps.vim
source $HOME/.config/nvim/plugin-config.lua
" source $HOME/.config/nvim/init.lua " one day I'll convert

" Shortcut to format json :FormatJSON
com! FormatJSON %!python -m json.tool

" { { THEME OPTIONS } }
" Use :Telescope colorscheme to quick change any color schemes!!
set termguicolors  " NeoSolarized requirement
set background=dark
color tokyonight   " Color scheme
set encoding=UTF-8 " Setting for vim-devicons



" { { Reload nerdtree icons (fixes brackets showing after resourcing) } }
if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif
