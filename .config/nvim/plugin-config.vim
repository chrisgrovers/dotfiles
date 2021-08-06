"
" ======= PLUGIN OPTIONS =======
"
" { { TELESCOPE CONFIG } }
lua << EOF
local actions = require('telescope.actions')

--
-- { { TELESCOPE } }
--
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-q>"] = actions.send_to_qflist,
      },
    }
  }
}

--
-- { { GITSIGNS } }
--
require('gitsigns').setup()

--
-- { { LSP Signature } }
--
-- Default config from the docs
local lsp_signature_config = {
  on_attach = function(client, bufnr)
    require "lsp_signature".on_attach({
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      handler_opts = {
        border = "single"
      }
    })
  end,
}

--
-- { { LSP CONFIG } }
--
require('lspconfig').tsserver.setup{ on_attach=on_attach }

EOF


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
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

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

