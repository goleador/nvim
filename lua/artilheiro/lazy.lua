-- lua/artilheiro/lazy.lua

require("lazy").setup({

  -- rose-pine colorscheme
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000, -- load before others
    config = function()
      require("rose-pine").setup({
        variant = "main",
        dark_variant = "main",
      })
      vim.cmd("colorscheme rose-pine")
    end,
  },

  -- Telescope + dependency
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup()
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- Treesitter playground
  {
    "nvim-treesitter/playground",
  },

  -- Harpoon (no config needed)
  {
    "ThePrimeagen/harpoon",
  },

  -- Undo tree
  {
    "mbbill/undotree",
  },
  -- Git integration
  {
    "tpope/vim-fugitive",
  },

  -- Lazy.nvim manages itself (optional)
  {
    "folke/lazy.nvim",
    version = "*",
  },

  {
    'neovim/nvim-lspconfig',
    config = function()
      require("artilheiro.lsp")
    end,
  },

  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = true,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" },
      })
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",              -- Snippets engine
      "saadparwaiz1/cmp_luasnip",      -- Snippet source for cmp
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },

  { "christoomey/vim-tmux-navigator" },

  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    config = function()
      require("nvim-tree").setup()
    end
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup {}
    end
  }
})
