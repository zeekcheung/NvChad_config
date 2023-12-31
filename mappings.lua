---@type MappingsTable
local M = {}

-- Disable default keymaps
M.disabled = {
  n = {
    ["<leader>ma"] = "",
    -- ["<leader>lf"] = "",
    -- ["<leader>ls"] = "",
    -- ["<leader>ph"] = "",
    -- ["<leader>pf"] = "",
    -- ["<leader>pt"] = "",
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
    -- ["<S-l>"] = {
    --   function()
    --     require("nvchad.tabufline").tabuflineNext()
    --   end,
    --   "Goto next buffer",
    -- },
    --
    -- ["<S-h>"] = {
    --   function()
    --     require("nvchad.tabufline").tabuflinePrev()
    --   end,
    --   "Goto prev buffer",
    -- },
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
    ["<C-e>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}

M.telescope = {
  n = {
    -- find
    ["<leader>fa"] = { "<cmd> Telescope autocommands <CR>", "Auto commands" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "Buffers" },
    ["<leader>fc"] = { "<cmd> e $MYVIMRC <CR>", "Config files" },
    ["<leader>fd"] = { "<cmd> Telescope diagnostics bufnr=0 <CR>", "Document diagnostics" },
    ["<leader>fD"] = { "<cmd> Telescope diagnostics <CR>", "Workspace diagnostics" },
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "Files" },
    ["<leader>fF"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "All files" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    ["<leader>fk"] = { "<cmd> Telescope keymaps <CR>", "Keymaps" },
    ["<leader>fM"] = { "<cmd> Telescope marks <CR>", "Bookmarks" },
    ["<leader>fp"] = { "<cmd> Telescope projects <CR>", "Projects" },
    ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Oldfiles" },
    ["<leader>fr"] = { "<cmd> Telescope registers <CR>", "Registers" },
    ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },

    -- git
    ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },

    -- theme switcher
    ["<leader>ft"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },
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
