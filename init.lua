-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.statuscolumn = "%s %l %r "

require("config.lazy")

vim.keymap.set("n", "<leader>e", function()
  require("oil").open()
end, { desc = "Open Oil" })
