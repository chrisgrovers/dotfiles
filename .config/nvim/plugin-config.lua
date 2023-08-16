-- ======= PLUGIN OPTIONS =======

-- disable netrw at the very start of your init.lua (strongly advised) for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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

-- { { LUALINE } }
local status, lualine = pcall(require, "lualine")
if (not status) then return end
lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight',
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
  extensions = {'fugitive', 'nvim-tree'}
}

-- { { NVIM-TREE } }
require('nvim-tree').setup {
  view = {
    adaptive_size = true,
  },
  update_focused_file = {
    -- Opting to manually update with <leader>jk
    -- enable = true,
    update_root = true,
    ignore_list = {},
  },
}

-- { { NVIM-AUTOPAIRS } }
require('nvim-autopairs').setup()

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<C-Down>"] = require('telescope.actions').cycle_history_next,
        ["<C-Up>"] = require('telescope.actions').cycle_history_prev,
      }
    }
  },
}

-- { { NVIM-CMP } } 
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['tsserver'].setup {
  capabilities = capabilities
}

-- { { ALPHA-NVIM } }
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local ascii = require("ascii")

dashboard.section.header.val = ascii.get_random_global()
dashboard.section.buttons.val = {
    dashboard.button( 'space f f', '  > Find file', ':cd $HOME/Workspace | Telescope find_files<CR>'),
    dashboard.button( 'space f g', '  > Find word', ':cd $HOME/Workspace | Telescope live_grep<CR>'),
    dashboard.button( 'space f r', '  > Recent'   , ':Telescope resume<CR>'),
    dashboard.button( 'space ,', '  > Settings' , ':e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>'),
    dashboard.button('c', ' Check health', ':checkhealth<CR>'),
    dashboard.button( 'q', '  > Quit NVIM', ':qa<CR>'),
}

-- Footer
local function footer()
  local version = vim.version()
  local pluginCount = vim.fn.len(vim.fn.globpath('~/.local/share/nvim/site/pack/packer/start', '*', 0, 1))
  local print_version = 'v' .. version.major .. '.' .. version.minor .. '.' .. version.patch
  local date = os.date '%d.%m.%Y'
  --local datetime = os.date '%d.%m.%Y %H:%M'
  return ' ' .. print_version .. '   ' .. pluginCount .. '   ' .. date
end


dashboard.section.footer.val = footer()
alpha.setup(dashboard.opts)

-- { { ALPHA-NVIM } }
require('alpha').setup(
  require'alpha.themes.dashboard'.config
) 
