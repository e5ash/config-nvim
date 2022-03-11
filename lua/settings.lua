local opt = vim.opt;
---------------------
-- Editor Settings --
---------------------
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"

opt.mouse = "a"

opt.swapfile = false
opt.fileencoding = "utf-8"

opt.wrap = false
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2

opt.smartcase = true
opt.smartindent = true

opt.scrolloff = 50
opt.sidescrolloff = 10


opt.cursorline = true
opt.termguicolors = true

vim.g.mapleader = ' '


-------------
-- Plugins --
-------------

-- Tree
require'nvim-tree'.setup {
  disable_netrw        = false,
  hijack_netrw         = true,
  open_on_setup        = false,
  ignore_buffer_on_setup = false,
  ignore_ft_on_setup   = {},
  auto_close           = false,
  auto_reload_on_write = true,
  open_on_tab          = false,
  hijack_cursor        = false,
  update_cwd           = false,
  hijack_unnamed_buffer_when_opening = false,
  hijack_directories   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    preserve_window_proportions = false,
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  },
  actions = {
    change_dir = {
      enable = true,
      global = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame", },
          buftype  = { "nofile", "terminal", "help", },
        }
      }
    }
  },
  log = {
    enable = false,
    types = {
      all = false,
      config = false,
      git = false,
    },
  },
}


-- LSP
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'pyright', 'tsserver' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}


-- Line
require('lualine').setup {
  options = {
    theme = 'material'
  }
}



-- Theme material
vim.g.material_style = 'deep ocean'

require('material').setup({
	contrast = {
		sidebars = true,
		cursor_line = true,
	},
	italics = {
		comments = true,
		functions = true,
	},
	contrast_filetypes = {
		"terminal",
		"packer",
		"qf",
	},
	disable = {
		borders = true,
		eob_lines = true
	},
	lualine_style = 'stealth'
})

-- Enable the colorscheme
vim.g.material_style = 'deep ocean'
require('material').setup({
	contrast = {
		sidebars = true,
		floating_windows = true,
		cursor_line = true,
	},
	italics = {
		comments = true,
		-- functions = true,
	},
	contrast_filetypes = {
		"terminal",
		"packer",
		"qf",
	},
	lualine_style = 'stealth'
})

-- Enable the colorscheme
vim.cmd 'colorscheme material'


-- Auto pairs
require('nvim-autopairs').setup{}


-- Comments
require('Comment').setup()



-- require("luasnip.loaders.from_vscode").lazy_load({ paths = { "../config/snippets } })
