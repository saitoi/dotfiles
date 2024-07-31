-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- In init.lua
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  command = "silent! lcd %:p:h",
})

-- Additional autocommand to update the working directory when Neotree changes directories
vim.api.nvim_create_autocmd("User", {
  pattern = "NeotreeDirChanged",
  callback = function()
    local cwd = vim.fn.expand("<afile>:p:h")
    vim.cmd("lcd " .. cwd)
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "markdown", "text" },
  callback = function()
    vim.opt_local.spell = false
  end,
})
