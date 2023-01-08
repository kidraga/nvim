local set_hl = vim.api.nvim_set_hl
vim.o.background='dark'
vim.cmd([[colorscheme kanagawa]])

set_hl(0, "CursorLineNr", {italic=true, fg="#FF9E3B"})
require("themes.common")
