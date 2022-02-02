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
color gruvbox " Color scheme
set encoding=UTF-8 " Setting for vim-devicons



" { { Reload nerdtree icons (fixes brackets showing after resourcing) } }
if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif

" { { GOOGLE SETTINGS } }
source /usr/share/vim/google/google.vim


" :PiperSelectActiveFiles comes by default from google.vim. It's so useful that
" we map it to <leader>p (i.e., ,p).
" Use :h piper for more details about the piper integration
noremap <silent> <leader>p :PiperSelectActiveFiles<CR>

" Load the blaze plugins, with the ,b prefix on all commands.
" Thus, to Blaze build, you can do <leader>bb.
" Since we've set the mapleader to ',' above, this should be ,bb in practice
Glug blaze plugin[mappings]='<leader>b'

" Loads youcompleteme, the awesomest autocompletion engine.
" See go/ycm for more details.
Glug youcompleteme-google

" Load the code formatting plugin. We first load the open-source version. Then,
" we load the internal google settings. Then, we automatically enable formatting
" when we write the file for Go, BUILD, proto, and c/cpp files.
" Use :h codefmt-google or :h codefmt for more details.
Glug codefmt
Glug codefmt-google
"
" Load the G4 plugin, which allows G4MoveFile, G4Edit, G4Pending, etc.
" Use :h g4 for more details about this plugin
Glug g4

" Load the Related Files plugin. Use :h relatedfiles for more details
Glug relatedfiles
nnoremap <silent> <leader>rf :RelatedFilesWindow<CR>

" Load the Critique integration. Use :h critique for more details
Glug critique

