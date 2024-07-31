-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- require("plugins.pyright")
-- require("config.keymaps")
vim.opt.shell = "/bin/zsh"

LazyVim.terminal.setup("/bin/zsh")
vim.keymap.set("n", "K", "5k", { noremap = true, silent = true })
vim.keymap.set("v", "K", "5k", { noremap = true, silent = true })

LazyVim.safe_keymap_set("n", "K", "5k", { noremap = true, silent = true })
