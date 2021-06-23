" TODO:
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/sets.vim
source $HOME/.config/nvim/remaps.vim
" source $HOME/.config/nvim/init.lua " one day I'll convert

" Shortcut to format json :FormatJSON
com! FormatJSON %!python -m json.tool

" { { THEME OPTIONS } }
set termguicolors  " NeoSolarized requirement
set background=dark
color gruvbox " Color scheme
set encoding=UTF-8 " Setting for vim-devicons
"
" =========== LSP CONFIG ==========
"
lua require('lspconfig').tsserver.setup{ on_attach=on_attach }
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true
"
"
" ======= PLUGIN OPTIONS =======
"
" { { DevIcons settings } }
let g:webdevicons_conceal_nerdtree_brackets = 1               
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true

" { { NERDTREE OPTIONS } }
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
augroup NerdTree
  autocmd! 
  autocmd StdinReadPre * let s:std_in=1
augroup END

" { { Lightline } }
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'absolutepath', 'modified' ] ],
      \ }
      \ }

" { { VimWiki } }
" All notes saved as markdown
let g:vimwiki_list = [{ 
      \ 'path': '~/notes/',
      \ 'syntax':'markdown', 
      \ 'folding':'syntax',
      \ 'ext': '.md' }]
let g:vimwiki_folding='custom'
