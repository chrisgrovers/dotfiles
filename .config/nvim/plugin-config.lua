-- ======= PLUGIN OPTIONS =======

-- disable netrw at the very start of your init.lua (strongly advised) for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local actions = require('telescope.actions')
local lspconfig = require('lspconfig')
local mason = require('mason')
local mason_lsp = require('mason-lspconfig')
local configs = require('lspconfig.configs')

local on_attach = function(client, bufnr)
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end
end

--
-- { { TREESITTER } }
--
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  matchup = {
    enable = true,              -- mandatory, false will disable the whole extension
    disable = { "c", "ruby" },  -- optional, list of language that will be disabled
    -- [options]
    matchup_matchparen_deferred = 1,
    matchup_matchparen_hi_surround_always = 1

  },
}

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

-- { { TELESCOPE } }
local lga_actions = require("telescope-live-grep-args.actions")
local actions = require("telescope.actions")
local action_state = require('telescope.actions.state')

-- https://github.com/nvim-telescope/telescope.nvim/issues/1048#issuecomment-993956937
local telescope_custom_actions = {}

function telescope_custom_actions._multiopen(prompt_bufnr, open_cmd)
    -- inspired from:
    -- https://github.com/nvim-telescope/telescope.nvim/issues/1048#issuecomment-1679797700
    local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
    local multi = picker:get_multi_selection()
    if not vim.tbl_isempty(multi) then
      require('telescope.actions').close(prompt_bufnr)
      for _, j in pairs(multi) do
        if j.path ~= nil then
          vim.cmd(string.format('%s %s', open_cmd, j.path))
        end
      end
    else
      require('telescope.actions').select_default(prompt_bufnr)
    end

end
function telescope_custom_actions.multi_selection_open_vsplit(prompt_bufnr)
    telescope_custom_actions._multiopen(prompt_bufnr, "vsplit")
end
function telescope_custom_actions.multi_selection_open_split(prompt_bufnr)
    telescope_custom_actions._multiopen(prompt_bufnr, "split")
end
function telescope_custom_actions.multi_selection_open_tab(prompt_bufnr)
    telescope_custom_actions._multiopen(prompt_bufnr, "tabe")
end
function telescope_custom_actions.multi_selection_open(prompt_bufnr)
    telescope_custom_actions._multiopen(prompt_bufnr, "edit")
end

-- https://github.com/nvim-telescope/telescope.nvim/issues/1048#issuecomment-1679797700
local select_one_or_multi = function(prompt_bufnr)
  local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
  local multi = picker:get_multi_selection()
  if not vim.tbl_isempty(multi) then
    require('telescope.actions').close(prompt_bufnr)
    for _, j in pairs(multi) do
      if j.path ~= nil then
        vim.cmd(string.format('%s %s', 'edit', j.path))
      end
    end
  else
    require('telescope.actions').select_default(prompt_bufnr)
  end
end

local tm = {
        -- live-grep-args configs
        -- https://github.com/nvim-telescope/telescope-live-grep-args.nvim#configuration
        ["<C-q>"] = lga_actions.quote_prompt(),
        ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
        -- https://github.com/nvim-telescope/telescope.nvim/issues/1048#issuecomment-993956937
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<TAB>"] = actions.toggle_selection,
        ["<C-TAB>"] = actions.toggle_selection + actions.move_selection_next,
        ["<S-TAB>"] = actions.toggle_selection + actions.move_selection_previous,
        ["<CR>"] = telescope_custom_actions.multi_selection_open,
        ["<C-v>"] = telescope_custom_actions.multi_selection_open_vsplit,
        ["<C-s>"] = telescope_custom_actions.multi_selection_open_split,
        ["<C-t>"] = telescope_custom_actions.multi_selection_open_tab,
        ["<C-DOWN>"] = require('telescope.actions').cycle_history_next,
        ["<C-UP>"] = require('telescope.actions').cycle_history_prev,
}

require('telescope').setup {
  defaults = {
    mappings = {
      i = tm,
      n = tm,
    },

    find_command = {
      "rg",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },

    -- Inspired by https://github.com/NvChad/NvChad/blob/v2.0/lua/plugins/configs/telescope.lua
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.90,
      preview_cutoff = 120,
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    use_less = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
  }
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
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
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
-- require('lspconfig')['tsserver'].setup {
--   capabilities = capabilities
-- }

mason.setup({})
mason_lsp.setup({
  ensure_installed = {"lua_ls", "markdown_oxide", "tsserver"},
  handlers = {
    function(server)
      lspconfig[server].setup({
        capabilities = capabilities,
      })
    end,
  }
})

-- { { TYPR } } 
-- local typr = require('typr')
-- typr.setup({})

-- { { ALPHA-NVIM } }
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local ascii = require("ascii")

dashboard.section.header.val = ascii.get_random_global()
dashboard.section.buttons.val = {
    dashboard.button( 'space f f', '  > Find file', ':cd $HOME/Workspace | Telescope find_files<CR>'),
    dashboard.button( 'space f g', '  > Find word', ':cd $HOME/Workspace | Telescope live_grep<CR>'),
    dashboard.button( 'space f o', '  > Recent files', ':Telescope oldfiles<CR>'),
    dashboard.button( 'space f b', '  > Bookmarks', ':Telescope marks<CR>'),
    dashboard.button( 'space ,'  , '  > Settings' , ':e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>'),
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


-- { { INDENT BLANKLINE } }
require("ibl").setup()


-- require("markview").setup({
--     buf_ignore = { "nofile" },
--     modes = { "n", "no" },
--
--     options = {
--         on_enable = {},
--         on_disable = {}
--     },
--
--     block_quotes = {},
--     checkboxes = {},
--     code_blocks = {},
--     headings = {},
--     horizontal_rules = {},
--     inline_codes = {},
--     links = {},
--     list_items = {},
--     tables = {}
-- });
