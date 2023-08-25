" ======= PLUGIN OPTIONS =======

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

" { { vim-matchup } }
let g:matchup_matchparen_deferred = 1
let g:matchup_matchparen_hi_surround_always = 1
