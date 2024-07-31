local colorscheme = require("lazyvim.plugins.colorscheme")
--
-- ---@type LazySpec
-- return {
--   "sho-87/kanagawa-paper.nvim",
--   lazy = false,
--   priority = 1000,
--   opts = {
--     colorscheme = "kanagawa-paper",
--   },
-- }

return {
  -- add Kanagawa
  { "rebelot/kanagawa.nvim" },

  -- Configure LazyVim to load Kanagawa
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa-wave", -- or "kanagawa-dragon" or "kanagawa-lotus"
    },
  },
}
