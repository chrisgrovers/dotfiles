" ======= PLUGIN OPTIONS =======

"
" { { COMPE BASE CONFIG } }
"
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.source = {
  \ 'path': v:true,
  \ 'buffer': v:true,
  \ 'nvim_lsp': v:true,
  \ }

"
" { { Prettier } }
"
" if isdirectory($PWD .'/node_modules')
"     let $PATH .= ':' . $PWD . '/node_modules/.bin'
" endif
" let g:neoformat_javascript_eslint = {
"             \ 'exe': 'prettier-eslint',
"             \ 'args': [],
"             \ }
"
" let g:neoformat_enabled_javascript = ['prettier-eslint']
"
" augroup fmt
"   autocmd!
"   autocmd BufWritePre * undojoin | Neoformat
" augroup END

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

