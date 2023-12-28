---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "everblush",
  theme_toggle = { "everblush", "one_light" },

  telescope = { style = "bordered" },

  statusline = {
    theme = "vscode_colored",
  },

  tabufline = {
    lazyload = false,
  },

  -- nvdash (dashboard)
  -- nvdash = {
  --   load_on_startup = true,
  --
  --   header = {
  --     "           ▄ ▄                   ",
  --     "       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
  --     "       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
  --     "    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
  --     "  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
  --     "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
  --     "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
  --     "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
  --     "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
  --   },
  --
  --   buttons = {
  --     { "  Find File", "Spc f f", "Telescope find_files" },
  --     { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
  --     { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
  --     { "  Bookmarks", "Spc f m", "Telescope marks" },
  --     { "  Themes", "Spc u c", "Telescope themes" },
  --     { "  Mappings", "Spc f k", "NvCheatsheet" },
  --   },
  -- },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
