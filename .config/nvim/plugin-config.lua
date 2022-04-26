-- ======= PLUGIN OPTIONS =======
local actions = require('telescope.actions')
local nvim_lsp = require('lspconfig')
local configs = require('lspconfig.configs')

local on_attach = function(client, bufnr)
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end
end

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

-- { { LUALINE } }
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
    enabled = true,
    update_cwd = true,
    ignore_list= {},
  }
}

-- { { NVIM-AUTOPAIRS } }
require('nvim-autopairs').setup()

require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-Down>"] = require('telescope.actions').cycle_history_next,
        ["<C-Up>"] = require('telescope.actions').cycle_history_prev,
      }
    }
  },
}
