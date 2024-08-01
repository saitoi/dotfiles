-- -----------------------------
-- General Settings
-- -----------------------------

local map = vim.keymap.set

-- Map J/K to move by 5 lines in normal/visual mode
map("n", "J", "5j", { noremap = true, silent = true })
map("v", "K", "5k", { noremap = true, silent = true })
map("n", "K", "5k", { noremap = true, silent = true })
map("v", "J", "5j", { noremap = true, silent = true })

-- Vertical split
map("n", "<leader>vs", ":vsplit %<CR>", { noremap = true, silent = true })

-- Find files in a specific directory
vim.api.nvim_set_keymap(
  "n",
  "<leader>r",
  '<cmd>lua require("telescope.builtin").find_files({ cwd = "/Users/pedrosaito/" })<CR>',
  { noremap = true, silent = true }
)

-- Toggle NeoTree
map("n", "<space>f", function()
  require("neo-tree.command").execute({ toggle = true })
  vim.cmd("wincmd p") -- Switch back to the previous window
end, { noremap = true, silent = true })

-- Open recent files
vim.api.nvim_set_keymap(
  "n",
  "<leader>fo",
  '<cmd>lua require("telescope.builtin").oldfiles()<CR><esc>',
  { noremap = true, silent = true }
)

-- -----------------------------
-- Terminal Mode Settings
-- -----------------------------

-- Enter Normal Mode in terminal
map("t", "<C-e>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })

-- Do Nothing
map("t", "<esc><esc>", "<NOP>", { desc = "Do Nothing" })

-- Open Terminal (Root Dir)
-- local lazyterm = function()
--   vim.cmd("set shell=/bin/zsh")
--   LazyVim.terminal(nil, { cwd = LazyVim.root() })
-- end
-- LazyVim.safe_keymap_set("n", "<leader>ft", lazyterm, { desc = "Terminal (Root Dir)" })
-- LazyVim.safe_keymap_set("n", "<leader>fT", function()
--   vim.cmd("set shell=/bin/zsh")
--   LazyVim.terminal()
-- end, { desc = "Terminal (cwd)" })
-- LazyVim.safe_keymap_set("n", "<c-`>", lazyterm, { desc = "Terminal (Root Dir)" })
-- LazyVim.safe_keymap_set("n", "<c-_>", lazyterm, { desc = "which_key_ignore" })
-- LazyVim.safe_keymap_set("t", "<C-`>", "<cmd>close<cr>", { desc = "Hide Terminal" })

-- -----------------------------
-- Functionality Settings
-- -----------------------------

-- Function to show documentation
function ShowDocumentation()
  local filetype = vim.bo.filetype
  if vim.tbl_contains({ "vim", "help" }, filetype) then
    vim.cmd("h " .. vim.fn.expand("<cword>"))
  elseif vim.fn.eval('exists(":Lspsaga hover_doc")') == 2 then
    vim.cmd("Lspsaga hover_doc")
  elseif vim.lsp.buf.original_hover then
    vim.lsp.buf.original_hover()
  else
    vim.cmd("!" .. vim.o.keywordprg .. " " .. vim.fn.expand("<cword>"))
  end
end

-- Map Ctrl+D to show documentation
vim.api.nvim_set_keymap("n", "<C-d>", ":lua ShowDocumentation()<CR>", { noremap = true, silent = true })

-- Toggle NeoTree and switch back to the previous window
local neotree_focused = false

vim.keymap.set("n", "F", function()
  if neotree_focused then
    vim.cmd("wincmd p") -- Switch back to the previous window
    neotree_focused = false
  else
    require("neo-tree.command").execute({ toggle = false, focus = true })
    neotree_focused = true
  end
end, { noremap = true, silent = true })

map("v", "K", "5k", { noremap = true, silent = true })
map("n", "K", "5k", { noremap = true, silent = true })
map("n", "o", "o<esc>", { noremap = true, silent = true })
map("n", "O", "o", { noremap = true, silent = true })

-- ~/.config/nvim/lua/plugin.lua or keymaps.lua
