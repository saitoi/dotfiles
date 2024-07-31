---@type LazySpec
return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  -- @type LSPConfig
  opts = {
    servers = {
      pyright = {
        on_attach = function(client, bufnr)
          -- Disable the default hover mapping
          vim.api.nvim_buf_del_keymap(bufnr, "n", "K")

          -- Buffer-local key mappings
          local opts = { noremap = true, silent = true }
          vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "5k", opts)
          vim.api.nvim_buf_set_keymap(bufnr, "v", "K", "5k", opts)

          -- Additional custom key mappings can go here
        end,
      },
    },
  },
}
