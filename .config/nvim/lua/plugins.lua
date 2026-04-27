return {
  -- { { Themes } }
  { 'folke/tokyonight.nvim' },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    opts = {
      integrations = {
        render_markdown = true,
        neorg = true,
        treesitter = true,
        gitsigns = true,
        telescope = true,
        notify = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
        },
      },
    }
  },

  -- { { Greeting Page } }
  {
    'goolord/alpha-nvim',
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      local ascii = require("ascii")

      dashboard.section.header.val = ascii.get_random_global()
      dashboard.section.buttons.val = {
        dashboard.button('space f f', '  > Find file', ':cd $HOME/Workspace | Telescope find_files<CR>'),
        dashboard.button('space f g', '  > Find word', ':cd $HOME/Workspace | Telescope live_grep<CR>'),
        dashboard.button('space f o', '  > Recent files', ':Telescope oldfiles<CR>'),
        dashboard.button('space f b', '  > Bookmarks', ':Telescope marks<CR>'),
        dashboard.button('space ,', '  > Settings', ':e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>'),
        dashboard.button('c', ' Check health', ':checkhealth<CR>'),
        dashboard.button('q', '  > Quit NVIM', ':qa<CR>'),
      }

      local function footer()
        local version = vim.version()
        local print_version = 'v' .. version.major .. '.' .. version.minor .. '.' .. version.patch
        local date = os.date '%d.%m.%Y'
        return ' ' .. print_version .. '   ' .. date
      end

      dashboard.section.footer.val = footer()
      alpha.setup(dashboard.opts)
    end
  },
  { 'MaximilianLloyd/ascii.nvim' },
  { 'MunifTanjim/nui.nvim' },

  -- { { UI Modernization } }
  {
    'folke/noice.nvim',
    event = "VeryLazy",
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.set_header_highlight"] = true,
          ["focus_augroup"] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },
  {
    'rcarriga/nvim-notify',
    opts = {
      timeout = 3000,
      max_width = 80,
    }
  },

  -- { { Display colors } }
  { 'norcalli/nvim-colorizer.lua', config = true },

  -- { { Nvim-tree } }
  { 'nvim-tree/nvim-web-devicons', config = true },
  {
    'nvim-tree/nvim-tree.lua',
    opts = {
      view = {
        adaptive_size = true,
        width = {
          max = 40,
        }
      },
      update_focused_file = {
        update_root = true,
        ignore_list = {},
      },
    }
  },

  -- { { Telescope } }
  { 'nvim-lua/popup.nvim' },
  { 'nvim-lua/plenary.nvim' },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-telescope/telescope-live-grep-args.nvim' },
    config = function()
      local telescope = require('telescope')
      local lga_actions = require("telescope-live-grep-args.actions")
      local actions = require("telescope.actions")

      local telescope_custom_actions = {}
      function telescope_custom_actions._multiopen(prompt_bufnr, open_cmd)
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
      function telescope_custom_actions.multi_selection_open(prompt_bufnr)
        telescope_custom_actions._multiopen(prompt_bufnr, "edit")
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

      local tm = {
        ["<C-q>"] = lga_actions.quote_prompt(),
        ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<TAB>"] = actions.toggle_selection,
        ["<CR>"] = telescope_custom_actions.multi_selection_open,
        ["<C-v>"] = telescope_custom_actions.multi_selection_open_vsplit,
        ["<C-s>"] = telescope_custom_actions.multi_selection_open_split,
        ["<C-t>"] = telescope_custom_actions.multi_selection_open_tab,
      }

      telescope.setup {
        defaults = {
          mappings = { i = tm, n = tm },
          prompt_position = "top",
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = { preview_width = 0.55, results_width = 0.8 },
          },
        }
      }
    end
  },

  -- { { Nvim-autopairs } }
  { 'windwp/nvim-autopairs', config = true },

  -- { { Treesitter } }
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { "bash", "c", "lua", "markdown", "markdown_inline", "vim", "vimdoc", "norg", "python", "typescript", "tsx", "javascript", "html", "css", "json", "yaml" },
        highlight = { enable = true },
        matchup = {
          enable = true,
          matchup_matchparen_deferred = 1,
          matchup_matchparen_hi_surround_always = 1
        },
      })
    end
  },
  { 'andymass/vim-matchup' },

  -- { { TPOPE } }
  { 'tpope/vim-surround' },
  { 'tpope/vim-abolish' },
  { 'tpope/vim-obsession' },
  { 'tpope/vim-fugitive' },

  -- { { LSP & Completion } }
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
    },
    config = function()
      require('mason').setup()
      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      require('mason-lspconfig').setup({
        ensure_installed = { "lua_ls", "markdown_oxide", "ts_ls" },
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({ capabilities = capabilities })
          end
        }
      })


      local cmp = require('cmp')
      cmp.setup({
        snippet = { expand = function(args) require('luasnip').lsp_expand(args.body) end },
        mapping = cmp.mapping.preset.insert({
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<C-Space>'] = cmp.mapping.complete(),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
        })
      })
    end
  },

  -- { { Commenting } }
  { 'numToStr/Comment.nvim', config = true },

  -- { { Git & VCS Integration } }
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      current_line_blame = true,
    }
  },
  {
    'NicolasGB/jj.nvim',
    opts = {},
  },

  -- { { Render Markdown } }
  {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {
      file_types = { 'markdown', 'vimwiki', 'Avante' },
      latex = { enabled = false },
    }
  },

  -- { { VimWiki } }
  {
    'vimwiki/vimwiki',
    branch = 'dev',
    init = function()
      vim.g.vimwiki_list = {{ path = '~/notes/', syntax = 'markdown', ext = '.md' }}
      vim.g.vimwiki_global_ext = 1
    end
  },

  -- { { Neorg } }
  {
    'nvim-neorg/neorg',
    lazy = false,
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neorg/lua-utils.nvim",
      "nvim-neotest/nvim-nio",
      "pysan3/pathlib.nvim",
    },
    config = function()
      require('neorg').setup({
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = { work = "~/notes/work", personal = "~/notes/personal" },
              default_workspace = "work",
            }
          },
          ["core.journal"] = { config = { workspace = "work" } },
        }
      })
    end
  },

  -- { { Status Line } }
  {
    'hoob3rt/lualine.nvim',
    opts = {
      options = { theme = 'auto', icons_enabled = true },
      sections = {
        lualine_c = {'filename'},
        lualine_x = {'diagnostics', 'filetype'},
      }
    }
  },

  -- { { Movement } }
  {
    'folke/flash.nvim',
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
  },

  -- { { MODERN TREATS } }
  { 'stevearc/oil.nvim', opts = {} },
  {
    'yetone/avante.nvim',
    event = "VeryLazy",
    build = "make",
    opts = {},
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
  }
}
