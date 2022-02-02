-- ======= PLUGIN OPTIONS =======
local actions = require('telescope.actions')
local lspconfig = require('lspconfig')

local on_attach = function(client, bufnr)
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end
end

--
-- { { G Defaults}}
--
local default_opts = {
  corpus = 'piper',                 -- `--corpus` flag passed to `cs`
  experimental = false,             -- when true, passes `--experimental` flag to `cs`
  add_workspace = true,             -- search for files within the current CITC client
  enable_proximity = true,          -- adds proximity which defaults to CWD
  max_num_results = 50,             -- defines max number of results returned by codesearch
  default_text_expand = nil,        -- if provided, calls `expand()` on this string, and uses result as default_text
  disable_devicons = false,         -- disable devicons in pickers

  -- Highlight groups to configure the look and feel of the selection area
  directory_hl_group = 'TelescopeResultsComment',
  filename_hl_grup = 'TelescopeResultsClass',
  lnum_hl_group = 'TelescopeResultsNumber',
  file_content_hl_group = 'TelescopeResultsComment',
}

--
-- { { TELESCOPE } }
--
require('telescope').setup{
  defaults =  {
    mappings = {
      i = {
        ["<C-q>"] = actions.send_to_qflist,
      },
    },
    -- { { G SETTINGS START}}
    -- The vertical layout strategy is good to handle long paths like those in
    -- google3 repos because you have nearly the full screen to display a file path.
    -- The caveat is that the preview area is smaller.
    layout_strategy = 'vertical',
    -- Common paths in google3 repos are collapsed following the example of Cider
    -- It is nice to keep this as a user config rather than part of
    -- telescope-codesearch because it can be reused by other telescope pickers.
    path_display = function(opts, path)
      -- Do common substitutions
      path = path:gsub("^/google/src/cloud/[^/]+/[^/]+/google3/", "google3/", 1)
      path = path:gsub("^google3/java/com/google/", "g3/j/c/g/", 1)
      path = path:gsub("^google3/javatests/com/google/", "g3/jt/c/g/", 1)
      path = path:gsub("^google3/third_party/", "g3/3rdp/", 1)
      path = path:gsub("^google3/", "g3/", 1)

      -- Do truncation. This allows us to combine our custom display formatter
      -- with the built-in truncation.
      -- `truncate` handler in transform_path memoizes computed truncation length in opts.__length.
      -- Here we are manually propagating this value between new_opts and opts.
      -- We can make this cleaner and more complicated using metatables :)
      local new_opts = {
        path_display = {
          truncate = true,
        },
        __length = opts.__length,
      }
      path = require('telescope.utils').transform_path(new_opts, path)
      opts.__length = new_opts.__length
      return path
    end,
  },
  extensions = { -- this block is optional, and if omitted, defaults will be used
    codesearch = {
      experimental = true           -- enable results from google3/experimental
    }
  },
  -- { { G SETTINGS END}}
  pickers = {
    find_files = {
      hidden = true
    }
  }
}

--
-- { { G SETTING }}
--
-- These custom mappings let you open telescope-codesearch quickly:
-- Fuzzy find files in codesearch.
vim.api.nvim_set_keymap('n', '<leader>gg',
  [[<cmd>lua require('telescope').extensions.codesearch.find_files{}<CR>]],
  { noremap = true, silent=true }
)

-- Search using codesearch queries.
vim.api.nvim_set_keymap('n', '<leader>gd',
  [[<cmd>lua require('telescope').extensions.codesearch.find_query{}<CR>]],
  { noremap = true, silent=true }
)

-- Search for the word under cursor.
vim.api.nvim_set_keymap('n', '<leader>gD',
[[<cmd>lua require('telescope').extensions.codesearch.find_query{default_text_expand='<cword>'}<CR>]],
{ noremap = true, silent=true }
)

-- Search for a file having word under cursor in its name.
vim.api.nvim_set_keymap('n', '<leader>gS',
[[<cmd>lua require('telescope').extensions.codesearch.find_files{default_text_expand='<cword>'}<CR>]],
{ noremap = true, silent=true }
)

-- Search for text selected in Visual mode.
vim.api.nvim_set_keymap('v', '<leader>gd',
[[<cmd>lua require('telescope').extensions.codesearch.find_query{}<CR>]],
{ noremap = true, silent=true }
)

--
-- { { GITSIGNS } }
--
require('gitsigns').setup()

--
-- { { LSP Signature } }
--
-- Default config from the docs
-- local lsp_signature_config = {
--   on_attach = function(client, bufnr)
--     require "lsp_signature".on_attach({
--       bind = true, -- This is mandatory, otherwise border config won't get registered.
--       handler_opts = {
--         border = "single"
--       }
--     })
--   end,
-- }

--
-- { { LSP CONFIG } }
--
-- lspconfig.tsserver.setup{ on_attach=on_attach }

--
-- { { LUALINE } }
--
local status, lualine = pcall(require, "lualine")
if (not status) then return end
lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
    section_separators = {'', ''},
    component_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {
      { 'diagnostics', sources = {"nvim_diagnostic"}, symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '} },
      'encoding',
      'filetype'
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {}, lualine_z = {}
  },
  tabline = {},
  extensions = {'fugitive'}
}

-- { { NVIM-TREE } }
require('nvim-tree').setup {
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {}
  }
}

-- { { NVIM-AUTOPAIRS } }
require('nvim-autopairs').setup()






