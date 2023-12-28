---@type NvPluginSpec[]
local plugins = {
  -- override plugin configs
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = {
      extensions_list = { "themes", "terms", "projects" },
    },
  },

  -- Override plugin definition options
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- web dev stuff
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "deno",
        "prettier",

        -- c/cpp stuff
        "clangd",
        "clang-format",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        -- "python",
        "query",
        "regex",
        "toml",
        -- "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },

      indent = {
        enable = true,
        -- disable = {
        --   "python"
        -- },
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = {
        enable = true,
        ignore = false,
      },

      renderer = {
        highlight_git = true,
        icons = {
          show = {
            git = false,
          },
        },
      },

      update_focused_file = {
        enable = true,
        update_root = true,
      },
    },
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "echasnovski/mini.move",
    keys = {
      { "<A-h>", mode = "n", desc = "Move line left" },
      { "<A-j>", mode = "n", desc = "Move line down" },
      { "<A-k>", mode = "n", desc = "Move line up" },
      { "<A-l>", mode = "n", desc = "Move line right" },
      { "<A-h>", mode = "v", desc = "Move selection left" },
      { "<A-j>", mode = "v", desc = "Move selection down" },
      { "<A-k>", mode = "v", desc = "Move selection up" },
      { "<A-l>", mode = "v", desc = "Move selection right" },
    },
    opts = {
      mappings = {
        left = "<A-h>",
        right = "<A-l>",
        down = "<A-j>",
        up = "<A-k>",
        line_left = "<A-h>",
        line_right = "<A-l>",
        line_down = "<A-j>",
        line_up = "<A-k>",
      },
    },
  },

  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {}
    end,
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    },
  },

  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>c"] = { name = "+code" },
        ["<leader>f"] = { name = "+find" },
        ["<leader>g"] = { name = "+git" },
        ["<leader>l"] = { name = "+lazy" },
        ["<leader>s"] = { name = "+session" },
        ["<leader>q"] = { name = "+quit" },
      },
    },
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  {
    "chrishrb/gx.nvim",
    event = { "BufEnter" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gx").setup {
        open_browser_app = "powershell.exe", -- specify your browser app; default for macOS is "open", Linux "xdg-open" and Windows "powershell.exe"
        -- open_browser_args = { "--background" }, -- specify any arguments, such as --background for macOS' "open".
        handlers = {
          plugin = true, -- open plugin links in lua (e.g. packer, lazy, ..)
          github = true, -- open github issues
          brewfile = true, -- open Homebrew formulaes and casks
          package_json = true, -- open dependencies from package.json
          search = true, -- search the web/selection on the web if nothing else is found
        },
        handler_options = {
          search_engine = "google", -- you can select between google, bing, duckduckgo, and ecosia
          -- search_engine = "https://search.brave.com/search?q=", -- or you can pass in a custom search engine
        },
      }
    end,
  },

  {
    "mrjones2014/smart-splits.nvim",
    event = "BufReadPost",
    keys = {
      { "<C-Up>", "<cmd>SmartResizeUp<cr>", "Resize Up" },
      { "<C-Down>", "<cmd>SmartResizeDown<cr>", "Resize Down" },
      { "<C-Left>", "<cmd>SmartResizeLeft<cr>", "Resize Left" },
      { "<C-Right>", "<cmd>SmartResizeRight<cr>", "Resize Right" },
    },
    opts = {
      -- Ignored filetypes (only while resizing)
      ignored_filetypes = {
        "nofile",
        "quickfix",
        "qf",
        "prompt",
      },
      -- Ignored buffer types (only while resizing)
      ignored_buftypes = { "nofile" },
    },
  },

  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = { options = vim.opt.sessionoptions:get() },
    -- stylua: ignore
    keys = {
      { "<leader>s", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
  },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    event = "VeryLazy",
    cmd = { "ToggleTerm", "TermExec" },
    keys = {
      { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float" },
      { "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "ToggleTerm horizontal split" },
      { "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "ToggleTerm vertical split" },
      { "<F7>", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
      {
        "<leader>tt",
        function()
          local cmd = tostring(math.floor(vim.fn.rand(vim.fn.srand()) % 1000 + 1)) .. "ToggleTerm"
          vim.cmd(cmd)
        end,
        desc = "ToggleTerm new",
      },

      { mode = "t", "<esc>", [[<C-\><C-n>]], buffer = 0 },
      { mode = "t", "<C-h>", [[<Cmd>wincmd h<CR>]], buffer = 0 },
      { mode = "t", "<C-j>", [[<Cmd>wincmd j<CR>]], buffer = 0 },
      { mode = "t", "<C-k>", [[<Cmd>wincmd k<CR>]], buffer = 0 },
      { mode = "t", "<C-l>", [[<Cmd>wincmd l<CR>]], buffer = 0 },
    },
    opts = {
      highlights = {
        Normal = { link = "Normal" },
        NormalNC = { link = "NormalNC" },
        NormalFloat = { link = "NormalFloat" },
        FloatBorder = { link = "FloatBorder" },
        StatusLine = { link = "StatusLine" },
        StatusLineNC = { link = "StatusLineNC" },
        WinBar = { link = "WinBar" },
        WinBarNC = { link = "WinBarNC" },
      },
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      on_create = function()
        vim.opt.foldcolumn = "0"
        vim.opt.signcolumn = "no"
      end,
      open_mapping = [[<F7>]],
      shading_factor = 2,
      direction = "float",
      float_opts = { border = "rounded" },
      hide_numbers = true,
      autochdir = true,
      start_in_insert = false,
      winbar = {
        enabled = false,
      },
      close_on_exit = true,
      auto_scroll = false,
    },

    config = function(_, opts)
      require("toggleterm").setup(opts)

      local Terminal = require("toggleterm.terminal").Terminal

      local lazygit = Terminal:new {
        cmd = "lazygit",
        dir = "git_dir",
        direction = "float",
        float_opts = {
          border = "double",
        },
        -- function to run on opening the terminal
        on_open = function(term)
          vim.cmd "startinsert!"
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
        end,
        -- function to run on closing the terminal
        on_close = function(term)
          vim.cmd "startinsert!"
        end,
      }

      local map = vim.keymap.set

      map("n", "<leader>gg", function()
        lazygit:toggle()
      end, { silent = true })
    end,
  },
}

return plugins
