---@type MappingsTable
local M = {}

-- Disable default keymaps
M.disabled = {
  n = {
    ["<leader>ma"] = "",
    ["<leader>lf"] = "",
    ["<leader>ls"] = "",
    ["<leader>ph"] = "",
    ["<leader>pf"] = "",
    ["<leader>pt"] = "",
  },
}

M.general = {
  n = {
    -- Save file
    ["<leader>w"] = { "<cmd> w <CR>", "Save file" },
    -- Select all
    ["<C-a>"] = { "ggVG", "Select whole file" },

    -- Copy
    ["<C-c>"] = { "<cmd> %y <CR>", "Copy selection" },

    -- Format
    ["<leader>cf"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP formatting",
    },

    -- Quit
    ["<leader>qq"] = { "<cmd> qa <CR>", "Quit all" },
    ["<leader>qw"] = { "<cmd> exit <CR>", "Quit current window" },

    -- Split
    ["\\"] = { "<cmd> vsplit <CR>", "Vertical split" },
    ["S-\\"] = { "<cmd> split <CR>", "Horizontal split" },

    -- Lazy
    ["<leader>l"] = { "<cmd> Lazy <CR>", "Lazy" },
  },

  v = {
    [">"] = { ">gv", "indent" },
  },

  t = {
    ["<C-x>"] = { vim.api.nvim_replace_termcodes("<Esc>", true, true, true), "Escape terminal mode" },
    ["q"] = { "<cmd> exit <CR>", "Quit current terminal" },
  },

  i = {
    ["<C-s>"] = { "<cmd> w <CR>", "Save file" },
  },
}

M.tabufline = {
  n = {
    -- cycle through buffers
    ["<S-l>"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["<S-h>"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },
  },
}

M.lspconfig = {
  n = {
    ["<leader>rn"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },

    ["<leader>d"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },
  },
}

M.nvimtree = {
  n = {
    -- toggle
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}

M.telescope = {
  n = {
    -- find
    ["<leader>fa"] = { "<cmd> Telescope autocomands <CR>", "Auto commands" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["<leader>fc"] = { "<cmd> e $MYVIMRC <CR>", "Config files" },
    ["<leader>fd"] = { "<cmd> Telescope diagnostic bufnr=0 <CR>", "Document diagnostics" },
    ["<leader>fD"] = { "<cmd> Telescope diagnostic <CR>", "Workspace diagnostics" },
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>fF"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    ["<leader>fm"] = { "<cmd> Telescope marks <CR>", "Find bookmarks" },
    ["<leader>fp"] = { "<cmd> Telescope projects <CR>", "Find projects" },
    ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    ["<leader>fr"] = { "<cmd> Telescope registers <CR>", "Find registers" },
    ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },

    -- git
    ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },

    -- theme switcher
    ["<leader>uc"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },
  },
}

M.gitsigns = {
  n = {
    ["<leader>gh"] = {
      function()
        require("gitsigns").preview_hunk()
      end,
      "Preview hunk",
    },
  },
}

-- more keybinds!

return M
