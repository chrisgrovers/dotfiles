" INSPIRATION:
" https://blog.inkdrop.app/how-to-set-up-neovim-0-5-modern-plugins-lsp-treesitter-etc-542c3d9c9887

source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/plugin-config.vim
source $HOME/.config/nvim/sets.vim
source $HOME/.config/nvim/remaps.lua
source $HOME/.config/nvim/plugin-config.lua
" source $HOME/.config/nvim/init.lua " one day I'll convert

" Shortcut to format json :FormatJSON
com! FormatJSON %!python -m json.tool

" { { THEME OPTIONS } }
" Use :Telescope colorscheme to quick change any color schemes!!
set termguicolors  " NeoSolarized requirement
set background=dark
" color tokyonight   " Color scheme
colorscheme catppuccin-mocha " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
set encoding=UTF-8 " Setting for vim-devicons



" { { Reload nerdtree icons (fixes brackets showing after resourcing) } }
if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif

" To make this work with TMux, you need to enable a special setting in Iterm2
" https://github.com/neovim/neovim/issues/3702

" copy the current text selection to the system clipboard
" if has('gui_running') || has('nvim') && exists('$DISPLAY')
"   noremap <Leader>y "+y
" else
"   " copy to attached terminal using the yank(1) script:
"   " https://github.com/sunaku/home/blob/master/bin/yank
"   noremap <silent> <Leader>y y:call system('osc52_yank > /dev/tty', @0)<Return>
" endif
