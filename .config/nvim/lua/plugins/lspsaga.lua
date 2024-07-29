return {
  -- Other plugins...

  -- Add lspsaga.nvim
  {
    "glepnir/lspsaga.nvim",
    config = function()
      require("lspsaga").setup({})
    end,
  },

  -- LazyVim configuration
  {
    "LazyVim/LazyVim",
    opts = {
      -- other options...
    },
  },
}
